provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  cidr                = var.cidr
  private_subnets_map = var.private_subnets_map
  public_subnets_map  = var.public_subnets_map
}

module "bastion" {
  source = "./modules/bastion"

  private_subnets_id   = module.vpc.private_subnets_id
  public_subnets_id    = module.vpc.public_subnets_id
  vpc_id               = module.vpc.vpc_id
  private_key_pem      = module.key.private_key_pem
  amason_linyx_ami     = data.aws_ami.latest_amason_linyx.id
  sg_bas_ingress_ports = var.sg_bas_ingress_ports
  key_name_bastion     = var.key_name_bastion
  instance_type        = var.instance_type
  depends_on           = [module.vpc, module.key]
}

module "key" {
  source = "./modules/key"
}

module "ecr" {
  source = "./modules/ecr"
}

module "claster" {
  source               = "./modules/claster"
  vpc_id               = module.vpc.vpc_id
  private_subnets_id   = module.vpc.private_subnets_id
  public_subnets_id    = module.vpc.public_subnets_id
  ecr_url              = module.ecr.ecr_url
  generated_key_name   = module.key.generated_key_name
  amason_linyx_ami     = data.aws_ami.latest_amason_linyx.id
  app_tag              = var.app_tag
  sg_alb_ingress_ports = var.sg_alb_ingress_ports
  sg_asg_ingress_ports = var.sg_asg_ingress_ports
  instance_type        = var.instance_type
  depends_on           = [module.ecr, module.local_build, module.vpc]
}

module "local_build" {
  source = "./modules/local_build"

  ecr_url     = module.ecr.ecr_url
  registry_id = module.ecr.registry_id
  github_url  = var.github_url
  region      = var.region
  app_name    = var.app_name
  app_tag     = var.app_tag
  depends_on  = [module.ecr]
}

data "aws_ami" "latest_amason_linyx" {
  owners      = ["591542846629"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}
