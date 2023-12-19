terraform {
  required_providers {
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = "1.5.1"
    }
  }
}

provider "prismacloud" {
  # Configuration options
  json_config_file = ".prismacloud_auth.json"
}
