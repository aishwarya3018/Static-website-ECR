#!/bin/bash

set -e

apt update -y


# Install Docker
apt install -y docker.io

systemctl start docker
systemctl enable docker


# Install AWS CLI v2

apt install -y unzip curl

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
-o awscliv2.zip

unzip awscliv2.zip

./aws/install


# Login to ECR

aws ecr get-login-password \
--region ap-south-1 \
| docker login \
--username AWS \
--password-stdin ${ecr_url}


# Pull image

docker pull ${docker_image}


# Run container

docker run -d \
--name website \
-p 80:80 \
${docker_image}