resource "aws_ecr_repository" "this" {
  name                 = "flask"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# resource "aws_ecr_repository_policy" "this" {
#   repository = aws_ecr_repository.this.name
#   policy     = <<EOF
#   {
#     "Version": "2008-10-17",
#     "Statement": [
#       {
#         "Sid": "adds full ecr access to the demo repository",
#         "Effect": "Allow",
#         "Principal": "*",
#         "Action": [
#           "ecr:BatchCheckLayerAvailability",
#           "ecr:BatchGetImage",
#           "ecr:CompleteLayerUpload",
#           "ecr:GetDownloadUrlForLayer",
#           "ecr:GetLifecyclePolicy",
#           "ecr:InitiateLayerUpload",
#           "ecr:PutImage",
#           "ecr:UploadLayerPart"
#         ]
#       }
#     ]
#   }
#   EOF
# }
