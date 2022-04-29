[
  {
    "essential": true,
    "memory": 256,
    "name": "worker",
    "cpu": 2,
    "image": "${ecr_url}:${app_tag}",
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": 5000
      }
    ],
    "environment": []
  }
]
