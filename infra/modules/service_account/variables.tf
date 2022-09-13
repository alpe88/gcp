variable "project_name" {
  description = "The name of the project?"
  type        = string
}

variable "service_account_prefix" {
  description = "Service account id prefix?"
  type        = string
}

variable "roles" {
  description = "List of roles for the service account"
  type        = list(string)
}

variable "token_creators" {
  description = "List of users who can create tokens for the service account"
  type        = list(string)
}
