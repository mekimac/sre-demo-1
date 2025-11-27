variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "eastus"
}

variable "name_suffix" {
  description = "Suffix to make resource names unique"
  type        = string
  default     = "sredemo01"
}
