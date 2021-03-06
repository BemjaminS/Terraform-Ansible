################################################
#           Create Resource Group              #
################################################
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

################################################
#              Virtual Networking              #
################################################
resource "azurerm_virtual_network" "vnet" {
  name                = "Virtual_Network"
  address_space       = [var.vnet-cidr]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create 2 subnet :Public and Private
resource "azurerm_subnet" "Public_subnet" {
  name                 = var.Public_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.Public_subnet_prefix
}
# Create private subnet
resource "azurerm_subnet" "Private_Subnet" {
  name                 = var.Private_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.Private_subnet_prefix
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }

  }

}

################################################
#              Public ip's                     #
################################################

# Create public IP
resource "azurerm_public_ip" "publicip" {
  name                = "Public_Ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"

}

resource "azurerm_public_ip" "Ansible_Public_ip" {
  name                = "API"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

################################################
#              Network interfaces              #
################################################

# Create network interface for vm1
resource "azurerm_network_interface" "nic" {
  name                = "myNIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "myNICConfg"
    subnet_id                     = azurerm_subnet.Public_subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.AppVmPublicIP1.id
  }
}

# Create network interface for vm2
resource "azurerm_network_interface" "nic2" {
  name                = "myNIC2"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "myNICConfg2"
    subnet_id                     = azurerm_subnet.Public_subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.AppVmPublicIP2.id

  }
}
# Create network interface for vm3
resource "azurerm_network_interface" "nic3" {
  name                = "myNIC3"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "myNICConfg3"
    subnet_id                     = azurerm_subnet.Public_subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.AppVmPublicIP3.id

  }
}



################################################
#         Network security group + rule        #
################################################

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = "Public_nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name


  security_rule {
    name                       = "SSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.my_ip
    destination_address_prefix = "10.0.1.0/24"
  }
  security_rule {
    name                       = "Port_8080"
    priority                   = 310
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   

}

resource "azurerm_network_security_group" "Private-nsg" {
  name                = "Private_nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name


  security_rule {
    name                       = "SSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "PORT_5432"
    priority                   = 310
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DenyAll"
    priority                   = 320
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


################################################
#              NSG associate to subnet         #
################################################

#Associate subnet to subnet_network_security_group
resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.Public_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

}
resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.Private_Subnet.id
  network_security_group_id = azurerm_network_security_group.Private-nsg.id
}

######################################################################################
#              Network interface association to network security group              #
######################################################################################


#Associate network interface1 to subnet_network_security_group
resource "azurerm_network_interface_security_group_association" "nsg_nic" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


#Associate network interface2 to subnet_network_security_group
resource "azurerm_network_interface_security_group_association" "nsg_nic2" {
  network_interface_id      = azurerm_network_interface.nic2.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#Associate network interface3 to subnet_network_security_group
resource "azurerm_network_interface_security_group_association" "nsg_nic3" {
  network_interface_id      = azurerm_network_interface.nic3.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}



#####################################################
#    Using module to create vm & availability set   #
#####################################################

module "vm" {
  source                = "./modules/av+vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id, azurerm_network_interface.nic2.id, azurerm_network_interface.nic3.id]
  admin_username        = var.admin_username
  admin_password        = var.admin_password

}


#####################################################
#             LOAD BALANCER & RULE & association    #
#####################################################
#Create Load Balancer
resource "azurerm_lb" "publicLB" {
  name                = "Public_LoadBalancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}
#Create backend address pool for the lb
resource "azurerm_lb_backend_address_pool" "backend_address_pool_public" {
  loadbalancer_id = azurerm_lb.publicLB.id
  name            = "BackEndAddressPool"
}

#Associate network interface1 to the lb backend address pool
resource "azurerm_network_interface_backend_address_pool_association" "nic_back_association" {
  network_interface_id    = azurerm_network_interface.nic.id
  ip_configuration_name   = azurerm_network_interface.nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool_public.id
}
#Associate network interface1 to the lb backend address pool
resource "azurerm_network_interface_backend_address_pool_association" "nic2_back_association" {
  network_interface_id    = azurerm_network_interface.nic2.id
  ip_configuration_name   = azurerm_network_interface.nic2.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool_public.id
}
#Associate network interface1 to the lb backend address pool
resource "azurerm_network_interface_backend_address_pool_association" "nic3_back_association" {
  network_interface_id    = azurerm_network_interface.nic3.id
  ip_configuration_name   = azurerm_network_interface.nic3.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool_public.id
}

#Create lb probe for port 8080
resource "azurerm_lb_probe" "lb_probe" {
  name                = "tcpProbe"
  #
  loadbalancer_id     = azurerm_lb.publicLB.id
  protocol            = "Http"
  port                = 8080
  interval_in_seconds = 5
  number_of_probes    = 2
  request_path        = "/"

}

#Create lb rule for port 8080
resource "azurerm_lb_rule" "LB_rule" {
  loadbalancer_id                = azurerm_lb.publicLB.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = azurerm_lb.publicLB.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.lb_probe.id
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.backend_address_pool_public.id]
}

resource "azurerm_lb_nat_rule" "nat_rule" {
  depends_on                     = [azurerm_lb.publicLB]
  resource_group_name            = azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.publicLB.id
  name                           = "SSH"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.publicLB.frontend_ip_configuration[0].name

}
#ssh access to vm1 from load balancer
resource "azurerm_network_interface_nat_rule_association" "nat_rule_association" {
  depends_on            = [azurerm_lb_nat_rule.nat_rule , module.vm]
  network_interface_id  = azurerm_network_interface.nic.id
  ip_configuration_name  = azurerm_network_interface.nic.ip_configuration[0].name
  nat_rule_id           = azurerm_lb_nat_rule.nat_rule.id
}


#Get data from vnet
data "azurerm_virtual_network" "data_vnet" {
  name                = azurerm_virtual_network.vnet.name
  resource_group_name = var.resource_group_name
}
#Get data from lb
data "azurerm_lb" "data_lb" {
  name                = azurerm_lb.publicLB.name
  resource_group_name = var.resource_group_name
}
#Get data from backend address pool
data "azurerm_lb_backend_address_pool" "data_pool" {
  name            = azurerm_lb_backend_address_pool.backend_address_pool_public.name
  loadbalancer_id = data.azurerm_lb.data_lb.id
}

#Get ip data
data "azurerm_public_ip" "ip" {
  name                = azurerm_public_ip.publicip.name
  resource_group_name = var.resource_group_name


}
####################################################
#          ansible admin virtual machine           #
####################################################

#create Ansible virtual machine
resource "azurerm_virtual_machine" "AVM" {
  name = "AnsibleAdmin"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.Ansible_nic.id]
  vm_size = var.public_vm_size


  storage_os_disk {
    name = "AnsibleDisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"

  }

  storage_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-focal"
    sku = "20_04-lts-gen2"
    version = "latest"
  }

  os_profile {
    computer_name = "AnsibleAdmin"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "Ansible_nic" {
  name                = "ansible_nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ansible_ip_conf"
    subnet_id                     = azurerm_subnet.Public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Ansible_Public_ip.id
  }
}


resource "azurerm_network_interface_security_group_association" "ANS_NSG" {
  network_interface_id      = azurerm_network_interface.Ansible_nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

