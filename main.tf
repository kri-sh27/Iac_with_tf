terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "zomatoapp" {
  name = "krishnahogale/zomatoapp:latest"
}

resource "docker_container" "zomatoapp_container" {
  image = docker_image.zomatoapp.image_id   # or docker_image.nginx.name
  name  = "my-zomatoapp-container"
  ports {
    internal = 3000
    external = 3000
  }
}

