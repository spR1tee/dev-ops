# modules/graylog/variables.tf
variable "network" {
  description = "Docker network name"
  type        = string
  default     = "monitoring_network"
}

variable "graylog_password_secret" {
  description = "Secret key for password encryption"
  type        = string
  default     = "aB3cD4eF5GhIjK6LmN7OpQ8rStUvWxYz"
}

variable "graylog_root_password_sha2" {
  description = "SHA256 hash of the root password"
  type        = string
  default     = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd37b5eeb2badd8a0ad"
}

variable "datanode_image" {
  description = "Graylog datanode image"
  type        = string
  default     = "graylog/graylog-datanode:6.0"
}

variable "graylog_image" {
  description = "Graylog server image"
  type        = string
  default     = "graylog/graylog:6.0"
}
