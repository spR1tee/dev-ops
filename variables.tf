# variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "prf-project"
}

variable "environment" {
  description = "Környezet neve (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "server_port" {
  description = "Az NodeJS szerver portja"
  type        = number
  default     = 5000
}

variable "client_port" {
  description = "Az Angular alkalmazás portja"
  type        = number
  default     = 4200
}

variable "db_port" {
  description = "A MongoDB portja"
  type        = number
  default     = 27017
}

variable "graylog_password_secret" {
  description = "Graylog password secret"
  type        = string
  sensitive   = true
  default     = "aB3cD4eF5GhIjK6LmN7OpQ8rStUvWxYz"
}

variable "graylog_root_password_sha2" {
  description = "Graylog root jelszó SHA-256 hash-e"
  type        = string
  sensitive   = true
  default     = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd37b5eeb2badd8a0ad"
}

