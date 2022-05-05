# It is a simple AWS VPC, built by Terraform with ECR and ECS

### project contains:

- 2 public subnets
- 2 private subnets
- Internet getaway
- 2 NAT
- Application load balancer
- Autoscaling group
- Bastion host
- ECR and ECS

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.001.png)

### security group

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.002.png)

### ECR and ECS

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.003.png)

### for run you need:

1 installed terraform, git and docker

2 clone this repository
```
git clone <https://github.com/612284/Kh-071-01-DevOps-Demo-3.git>
```
3 enter your variables in the terraform.tfvars file
```
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
```
4 to add AWS credentials for example create 2 files
~/.aws/credentials
```
[default]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key
```
~/.aws/config
```
[default]
region = your_aws_region
```
or run in terminal
```
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key
export AWS_REGION=your_aws_region
```


5 run Teppaform
```
terraform init
terraform plan
terraform apply
```

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.004.png)

By the value specified in alb\_dns\_name we can check the work of the load balancer

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.005.png)

By value specified in bastion\_public\_ip we can do ssh connect to bastion host.

And then we can connect to other instances in a private subnet

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.006.png)

Resources created by terraform

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.007.png)

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.008.png)

![](img/Aspose.Words.590efbc6-30d3-4508-b182-49c0c6302455.009.png)
