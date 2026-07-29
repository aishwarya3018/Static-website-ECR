output "ecr_repository_url" {


  value = aws_ecr_repository.static_website.repository_url


}



output "website_public_ip" {


  value = aws_instance.website.public_ip


}



output "website_url" {


  value = "http://${aws_instance.website.public_ip}"


}