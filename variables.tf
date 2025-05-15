variable "project_name" {}

variable "location" {}

variable "environment" {}

variable "enable_appservice" {
  default = false
}

variable "enable_storage" {
  default = false
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}
