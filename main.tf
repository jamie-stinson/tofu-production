module "talos" {
  source = "git::https://github.com/jamie-stinson/common-tofu-talos-module?ref=v0.1.0"
  talos  = var.talos
}
