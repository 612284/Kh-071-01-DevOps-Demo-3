resource "aws_ecs_task_definition" "task_definition" {
  family                   = "worker"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  container_definitions    = data.template_file.task_definition_template.rendered
}
data "template_file" "task_definition_template" {
  template = templatefile("modules/claster/task_definition.json.tpl", {
    ecr_url = var.ecr_url,
    app_tag = var.app_tag
  })
}
