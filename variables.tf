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

