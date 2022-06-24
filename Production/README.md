<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.10.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm"></a> [vm](#module\_vm) | ./modules/av+vm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.publicLB](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_address_pool_public](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_rule.nat_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_nat_rule) | resource |
| [azurerm_lb_probe.lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.LB_rule](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/lb_rule) | resource |
| [azurerm_network_interface.Ansible_nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic2](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic3](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_backend_address_pool_association.nic2_back_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_backend_address_pool_association.nic3_back_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_backend_address_pool_association.nic_back_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_nat_rule_association.nat_rule_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_nat_rule_association) | resource |
| [azurerm_network_interface_security_group_association.ANS_NSG](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nsg_nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nsg_nic2](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nsg_nic3](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.Private-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/network_security_group) | resource |
| [azurerm_postgresql_flexible_server.postgres](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.flexible_server_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.fwconfig](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [azurerm_private_dns_zone.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.Ansible_Public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.publicip](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.Private_Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet) | resource |
| [azurerm_subnet.Public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.private](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_machine.AVM](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/resources/virtual_network) | resource |
| [azurerm_lb.data_lb](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/data-sources/lb) | data source |
| [azurerm_lb_backend_address_pool.data_pool](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/data-sources/lb_backend_address_pool) | data source |
| [azurerm_public_ip.ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/data-sources/public_ip) | data source |
| [azurerm_virtual_network.data_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.10.0/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Postgres_UserName"></a> [Postgres\_UserName](#input\_Postgres\_UserName) | n/a | `string` | `"postgres"` | no |
| <a name="input_Private_subnet_name"></a> [Private\_subnet\_name](#input\_Private\_subnet\_name) | n/a | `string` | `"Private_Subnet"` | no |
| <a name="input_Private_subnet_prefix"></a> [Private\_subnet\_prefix](#input\_Private\_subnet\_prefix) | n/a | `list` | <pre>[<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_Public_subnet_name"></a> [Public\_subnet\_name](#input\_Public\_subnet\_name) | n/a | `string` | `"Public_Subnet"` | no |
| <a name="input_Public_subnet_prefix"></a> [Public\_subnet\_prefix](#input\_Public\_subnet\_prefix) | n/a | `list` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Password input for DATABASE / VIRTUAL\_MACHINE | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Administrator user name for virtual machine | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region to build into | `string` | `"australia east"` | no |
| <a name="input_my_ip"></a> [my\_ip](#input\_my\_ip) | Your public ip to grant access to vm from your local machine | `string` | n/a | yes |
| <a name="input_postgres_user_name"></a> [postgres\_user\_name](#input\_postgres\_user\_name) | Postgres\_Username | `string` | `"postgres"` | no |
| <a name="input_public_vm_size"></a> [public\_vm\_size](#input\_public\_vm\_size) | Vm-Size Config | `string` | `"Standard_B1s"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | `"Terraform-Week-6"` | no |
| <a name="input_vnet-cidr"></a> [vnet-cidr](#input\_vnet-cidr) | Vnet address space(CIDR) | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DATABASE_PASSWORD"></a> [DATABASE\_PASSWORD](#output\_DATABASE\_PASSWORD) | n/a |
| <a name="output_password"></a> [password](#output\_password) | n/a |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | Print public ip |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END_TF_DOCS -->