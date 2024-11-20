terraform {
  required_providers {
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = "1.5.9"
    }
  }
}

provider "prismacloud" {
  # Configuration options
  json_config_file = ".prismacloud_auth.json"
}
