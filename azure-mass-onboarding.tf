data "prismacloud_account_supported_features" "prismacloud_supported_features" {
  cloud_type      = "azure"
  account_type    = "account"
  deployment_type = "azure"
}

// Retrive existing account group id based on the name
data "prismacloud_account_group" "existing_account_group_id" {
  name = var.account_group_name
}

locals {
  instances = csvdecode(file(var.csv_file_name))
}

resource "prismacloud_cloud_account_v2" "azure_account_bulk_onboarding_example" {
  for_each = { for inst in local.instances : inst.name => inst }

  azure {
    account_id = each.value.accountId
    group_ids = [
      data.prismacloud_account_group.existing_account_group_id.group_id,
    ]
    name                 = each.value.name
    client_id            = each.value.clientId
    key                  = each.value.key
    tenant_id            = each.value.tenantId
    monitor_flow_logs    = true
    service_principal_id = each.value.servicePrincipalId
    features {
      name  = "Agentless Scanning"
      state = "enabled"
    }
    features {
      name  = "Auto Protect"
      state = "enabled"
    }
    features {
      name  = "Serverless Function Scanning"
      state = "enabled"
    }
    features {
      name  = "Remediation"
      state = "enabled"
    }
  }
}
