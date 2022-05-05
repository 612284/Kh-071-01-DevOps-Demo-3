# output "vpc_id" {
#   description = "The ID of the VPC"
#   value       = module.vpc.vpc_id
# }
#
# output "public_subnets_id" {
#   description = "The ID of the VPC"
#   value       = module.vpc.public_subnets_id
# }
#
# output "private_subnets_id" {
#   description = "The ID of the VPC"
#   value       = module.vpc.private_subnets_id
# }

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

# output "ecr_url" {
#   value = module.ecr.ecr_url
# }

output "alb_dns_name" {
  value = module.claster.alb_dns_name
}

# output "aws_ami" {
#   value = data.aws_ami.latest_amason_linyx.id
# }

# output "registry_id" {
#   value = module.ecr.registry_id
# }
