#Print public ip
output "public_ip_address" {
  value = data.azurerm_public_ip.ip.ip_address
}

output "username" {
  value = var.admin_username
  sensitive = true
}

output "password" {
  value = module.vm.Admin_Password
  sensitive = true
}

output "DATABASE_PASSWORD" {
  value = var.admin_username
  sensitive = true
}



