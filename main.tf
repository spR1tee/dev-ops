# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Közös hálózat létrehozása
resource "docker_network" "app_network" {
  name = "${var.project_name}-network"
  driver = "bridge"
  # Enable IPv6 if needed
  ipam_config {
    subnet = "172.100.0.0/16"  # Customize subnet as needed
    gateway = "172.100.0.1"
  }
  internal = false
}

# MongoDB modul
module "mongodb" {
  source = "./modules/mongodb"
  
  app_port = var.db_port
  container_name = "${var.project_name}-mongodb"
}

# NodeJS alkalmazás modul
module "nodejs_app" {
  source = "./modules/nodejs-app"
  
  app_port = var.server_port
  container_name = "${var.project_name}-nodejs"
}

# Angular alkalmazás modul
module "angular_app" {
  source = "./modules/angular-app"
  
  app_port = var.client_port
  container_name = "${var.project_name}-angular"
}

# Prometheus modul
module "prometheus" {
  source = "./modules/prometheus"
  
  network = docker_network.app_network.name
  nodejs_app_name = module.nodejs_app.container_name
}

# Grafana modul
module "grafana" {
  source = "./modules/grafana"
  
  network = docker_network.app_network.name
  prometheus_url = "http://prometheus:9090"
}

# Graylog modul
module "graylog" {
  source = "./modules/graylog"
  
  network                    = docker_network.app_network.name
  graylog_password_secret    = var.graylog_password_secret
  graylog_root_password_sha2 = var.graylog_root_password_sha2
}

output "network_info" {
  value = {
    network_id   = docker_network.app_network.id
    network_name = docker_network.app_network.name
  }
}
