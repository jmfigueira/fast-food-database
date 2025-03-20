variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_instance_name" {
  description = "RDS instance name"
  type        = string
  default     = "database-1"
}

variable "db_username" {
  description = "Master database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "db_storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}
