module "keyvault" {
  source         = "../../../modules/azure/keyvault"
  key_vault_name = "kv-gcssre-dev-datadog"
  location       = "japaneast"
  bypass         = "AzureServices"
  ip_rules = [
    "103.240.131.0/25"
    ]
  is_network_acls_default_action_allow = false
  tags                                 = {}

  vault = {

    location                    = "japaneast"
    resource_group_name         = "rg-gcssre-dev-kv-datadog-je"
    purge_protection_enabled    = false
    enabled_for_disk_encryption = true
    sku_name                    = "standard"
    enable_rbac_authorization   = true
    enabled_for_deployment      = true
    tenant_id                   = "4909470c-a0a3-4be0-ba04-56a7cff4a587"

  }
  depends_on = [module.resource_group]

}

module "resource_group" {
  source                  = "../../../modules/azure/resource_group"
  resource_group_name     = "rg-gcssre-dev-kv-datadog-je"
  resource_group_location = "japaneast"
}
