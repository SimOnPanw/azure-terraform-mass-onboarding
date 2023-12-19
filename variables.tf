
variable "account_group_name" {
  description = "Account Group Name"
  type        = string
  default     = "Eurofins"
}
variable "csv_file_name" {
  description = "The name of the csv file that contains the subscriptions to onboard"
  type        = string
  default     = "azure.csv"
}
