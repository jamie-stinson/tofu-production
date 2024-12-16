environment = "production"

talos = {
  cluster = {
    name               = "myCluster"
    vip_address        = "10.0.0.30"
    kubernetes_version = "v1.30.2"
    talos_version      = "v1.7.5"
  }

  node_data = {
    default_gateway = "10.0.0.1"
    dns_endpoint    = "10.0.0.1"
    ntp_endpoint    = "time.cloudflare.com"

    control_plane = {
      nodes     = {
        "10.0.0.31" = {}
      }
    }

    worker = {
      nodes     = {
        "10.0.0.34" = {}
      }
    }
  }
}

argocd = {
  namespace = "argocd"
}
