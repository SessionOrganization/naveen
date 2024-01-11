variable "resource_group_name" {
  default     = ""
  type        = string
  description = "The Name which should be used for this Resource Group"
}

variable "resource_group_location" {
  type        = string
  default     = ""
  description = "The Azure Region where the Resource Group should exist."
}
