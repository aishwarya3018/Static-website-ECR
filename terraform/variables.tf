variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}


variable "repository_name" {
  description = "ECR Repository Name"
  type        = string
  default     = "static-website"
}


variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}


variable "docker_image" {
  description = "Docker Image URL"
  type        = string
}

variable "ecr_url" {
  type = string
}