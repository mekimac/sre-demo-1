variable "project_name" {
  type        = string
  default     = "sre-demo"
  description = "Prefix for all resource names"
}

variable "location" {
  type        = string
  default     = "southcentralus" # Dallas-ish region; you can change if you want
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  default     = "rg-sre-demo"
  description = "Resource group name"
}

variable "aks_node_count" {
  type        = number
  default     = 1
  description = "Number of AKS worker nodes (keep 1 to control cost)"
}

variable "aks_node_size" {
  type        = string
  default     = "Standard_B2s_v2" # small, cost-friendly VM
  description = "VM size for AKS nodes"
}

variable "postgres_admin_user" {
  type        = string
  default     = "sreadmin"
  description = "PostgreSQL admin username"
}

variable "postgres_admin_password" {
  type        = string
  sensitive   = true
  description = "PostgreSQL admin password"
}

variable "postgres_sku_name" {
  type        = string
  default     = "B_Standard_B1ms" # small DB SKU to reduce cost
  description = "Postgres SKU (pricing tier)"
}
