terraform {
  required_version = "~> 1.7.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "OpenJamLab"
    workspaces {
      name = "tofu-production"
    }
  }

  required_providers {
    talos = {
      source  = "siderolabs/talos"
      version = "0.6.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

provider "talos" {}
provider "random" {}
provider "tls" {}

provider "kubernetes" {
  host                   = module.talos.host
  client_certificate     = base64decode(module.talos.client_certificate)
  client_key             = base64decode(module.talos.client_key)
  cluster_ca_certificate = base64decode(module.talos.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.talos.host
    client_certificate     = base64decode(module.talos.client_certificate)
    client_key             = base64decode(module.talos.client_key)
    cluster_ca_certificate = base64decode(module.talos.cluster_ca_certificate)
  }
}