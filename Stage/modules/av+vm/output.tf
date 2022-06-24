output "Admin_Password" {
  value = azurerm_virtual_machine.vm.os_profile[*].admin_password
}


