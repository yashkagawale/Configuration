# Configure the Docker provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull Nginx image from DockerHub
resource "docker_image" "nginx" {
  name        = "nginx:latest"
  keep_locally = false
}

# Create an Nginx container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx_terraform"

  ports {
    internal = 80
    external = 8088
  }
}