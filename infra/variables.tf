variable "project_name" {
  description = "The name of the project?"
  default     = "test-project-362121"
  type        = string
}

variable "env" {
  description = "The environment (dev, test, stage, prod)?"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.env)
    error_message = "Valid values for var: env are (dev, test, stage, prod)."
  }
}

variable "region" {
  description = "The region that the project will be created in. (This should be region format, e.g. europe-west2)"
  type        = string
  default     = "us-central1"
}

variable "admin_users" {
  description = "The comma separated list (array) of google email addresses of users to be assigned as IAM admins for this project"
  default     = ["aleksandar.petrovic.1988@gmail.com", "stringerpoitier@gmail.com"]
  type        = list(string)
}
