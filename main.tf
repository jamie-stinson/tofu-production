module "talos" {
  source = "git::https://github.com/jamie-stinson/common-tofu-talos-module?ref=v0.1.0"
  talos  = var.talos
}

module "argocd" {
  source = "git::https://github.com/jamie-stinson/common-tofu-argocd-module?ref=v0.5.0"
  argocd = var.argocd
  environment = var.environment
  depends_on = [
    module.talos
  ]
}
