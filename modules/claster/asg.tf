# resource "aws_launch_configuration" "ecs_launch_config" {
#   image_id             = var.amason_linyx_ami
#   iam_instance_profile = aws_iam_instance_profile.ecs_agent.name
#   security_groups      = [aws_security_group.worker.id]
#   user_data            = "#!/bin/bash\necho ECS_CLUSTER=my-cluster >> /etc/ecs/ecs.config"
#   key_name             = "aws-frakfurt"
#   instance_type        = "t2.micro"
# }

resource "aws_launch_template" "worker_template" {
  name                    = "worker-template"
  disable_api_termination = false
  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_agent.name
  }
  image_id                             = var.amason_linyx_ami
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = var.generated_key_name
  vpc_security_group_ids               = [aws_security_group.worker.id]

  user_data = filebase64("modules/claster/launch_tmpl_usr_data.sh")
}

resource "aws_autoscaling_group" "ecs_asg" {
  name                = "asg"
  vpc_zone_identifier = var.public_subnets_id
  # launch_configuration = aws_launch_configuration.ecs_launch_config.name
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  tag {
    key                 = "Name"
    value               = "worker"
    propagate_at_launch = true
  }
  launch_template {
    id      = aws_launch_template.worker_template.id
    version = "$Latest"
  }
}

resource "aws_security_group" "worker" {
  vpc_id = var.vpc_id
  name   = "worker security group"
  # dynamic "ingress" {
  #   for_each = [22, 80, 5000]
  #   content {
  #     from_port   = ingress.value
  #     to_port     = ingress.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "worker security group"
  }
}
