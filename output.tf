output "features_supported" {
  value = data.prismacloud_account_supported_features.prismacloud_supported_features.supported_features
}
