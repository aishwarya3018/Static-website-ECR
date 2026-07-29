data "aws_ami" "ubuntu" {


  most_recent = true


  owners = [

    "099720109477"

  ]



  filter {

    name = "name"


    values = [

      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"

    ]

  }



  filter {

    name = "virtualization-type"


    values = [

      "hvm"

    ]

  }


}




resource "aws_instance" "website" {


  ami = data.aws_ami.ubuntu.id


  instance_type = var.instance_type



  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name



  vpc_security_group_ids = [

    aws_security_group.website_sg.id

  ]



  user_data = templatefile(

    "${path.module}/userdata.sh",

    {

      docker_image = var.docker_image
      ecr_url      = var.ecr_url
    }

  )



  user_data_replace_on_change = true



  tags = {


    Name = "static-website-ec2"


  }


}