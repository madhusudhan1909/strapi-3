provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "strapi" {
  ami           = "ami-003c463c8207b4dfa" # Use the appropriate AMI ID for your region
  instance_type = "t2.micro"

  user_data = <<-EOF
        #!/bin/bash
        apt-get update
        apt-get install -y nodejs npm git
        npm install -g yarn
        npm install -g pm2
        mkdir -p /srv/strapi
        cd /srv/strapi
        git clone https://github.com/madhusudhan1909/strapi-task.git
        yarn install
        yarn build
        pm2 start yarn --name "strapi" -- start
        EOF

  tags = {
    Name = "StrapiInstance"
    Environment = "Production"
  }
}

output "instance_ip" {
  value = aws_instance.strapi.public_ip
}
