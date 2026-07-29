resource "aws_ecr_repository" "static_website" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project     = "Static-website-ECR"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}