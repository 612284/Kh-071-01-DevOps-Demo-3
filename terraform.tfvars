region               = "eu-central-1"
cidr                 = "10.0.0.0/16"
instance_type        = "t2.micro"
key_name_bastion     = "aws-key-name"
sg_alb_ingress_ports = ["80"]
sg_bas_ingress_ports = ["22"]
sg_asg_ingress_ports = ["49153", "49154", "49155", "49156", "49157", "22"]
github_url           = "https://github.com/612284/flask-app.git"
app_name             = "flask"
app_tag              = "1"
private_subnets_map = {
  subnet_1 = {
    az   = "eu-central-1a"
    cidr = "10.0.1.0/24"
  }
  subnet_2 = {
    az   = "eu-central-1b"
    cidr = "10.0.2.0/24"
  }
}
public_subnets_map = {
  subnet_1 = {
    az   = "eu-central-1a"
    cidr = "10.0.101.0/24"
  }
  subnet_2 = {
    az   = "eu-central-1b"
    cidr = "10.0.102.0/24"
  }
}
