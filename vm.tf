module "kynatividad" {
  source              = "github.com/ARCH-AMIS/tf_mod_az_virtual_machines?ref=tag"
  linux_server        = true
  name                = "VM-kynatividad"
  resource_group_name = "AMIS-AUTOMATION-CHALLENGE-kynatividad"
  size                = "Standard_B2s"
  timezone            = "GMT Standard Time"
  source_image_reference = {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-LVM"
    version   = "latest"
  }
  tags = {
    Entity            = "AMIS"
    AppDomain         = "Infrastructure & Service Delivery"
    AppDomainOwner    = "Kym Natividad"
    Environment       = "Test"
    CreatedBy         = "Kym Natividad"
  }
  virtual_network        = "AMIS-USE2-XVNET-IAC-CHALLENGE"
  virtual_network_rg     = "AMIS-USE2-SANDBOX-IAC-CHALLENGE-RGRP00"
  virtual_network_subnet = "AMIS-USE2-SNET01-IAC-CHALLENGE"
  admin_username         = "kynatividad"
  key_vault_id           = data.azurerm_key_vault.key_vault.id
  data_disks = {
    "0" = {
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = 32
      caching              = "ReadOnly"
    }
  }
}