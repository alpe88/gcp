variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "firebase_admin_users" {
  description = "The comma separated list (array) of google email addresses of users to be assigned as IAM admins for this Firebase project"
  type        = list(string)
}
