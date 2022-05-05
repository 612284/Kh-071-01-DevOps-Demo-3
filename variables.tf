variable "region" {
  description = "region"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}
variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = ""
}
variable "key_name_bastion" {
  description = "key_name_bastion"
  type        = string
  default     = ""
}

variable "sg_alb_ingress_ports" {
  type    = list(string)
  default = []
}

variable "sg_asg_ingress_ports" {
  type    = list(string)
  default = []
}
variable "sg_bas_ingress_ports" {
  type    = list(string)
  default = []
}
variable "github_url" {
  description = "github url"
  type        = string
  default     = ""
}
variable "app_name" {
  description = "app name"
  type        = string
  default     = ""
}
variable "app_tag" {
  description = "app tag"
  type        = string
  default     = ""
}
variable "public_subnets_map" {
  description = "public subnets map"
  type = map(object({
    az   = string
    cidr = string
  }))
}
variable "private_subnets_map" {
  description = "private subnets map"
  type = map(object({
    az   = string
    cidr = string
  }))
}
