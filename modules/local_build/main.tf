terraform {
  required_version = "> 0.8.0"
}

resource "null_resource" "build" {
  provisioner "local-exec" {
    command = "modules/local_build/build.sh"

    environment = {
      region      = var.region
      ecr_url     = var.ecr_url
      registry_id = var.registry_id
      github_url  = var.github_url
      app_name    = var.app_name
      app_tag     = var.app_tag
    }
  }
}
