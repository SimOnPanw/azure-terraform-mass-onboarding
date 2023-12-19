data "prismacloud_account_supported_features" "prismacloud_supported_features" {
  cloud_type      = "azure"
  account_type    = "account"
  deployment_type = "azure"
}

data "prismacloud_azure_template" "prismacloud_azure_template" {
  file_name       = "prismacloud_azure_template.json"
  account_type    = "account"
  tenant_id       = var.tenant_id
  deployment_type = "azure"
  subscription_id = ""
  features        = data.prismacloud_account_supported_features.prismacloud_supported_features.supported_features
}

// Retrive existing account group name id
data "prismacloud_account_group" "existing_account_group_id" {
  name = var.account_group_name
}


locals {
  instances = csvdecode(file("azure.csv"))
}


resource "prismacloud_cloud_account_v2" "azure_account_bulk_onboarding_example" {
  for_each = { for inst in local.instances : inst.name => inst }

  azure {
    account_id           = each.value.accountId
    group_ids            = each.value.groupIDs
    name                 = each.value.name
    client_id            = each.value.clientId
    key                  = each.value.key
    tenant_id            = each.value.tenantId
    service_principal_id = each.value.servicePrincipalId
  }
}
