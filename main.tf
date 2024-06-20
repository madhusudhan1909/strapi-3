provider "aws" {
  region = "ap-southeast-1"  // Specifies the AWS region as Singapore
}

resource "aws_instance" "strapi" {
  ami           = "ami-03d5c68bab01f3496"  // Ubuntu 20.04 LTS AMI (adjust as needed)
  instance_type = "t2.micro"  // Instance type (adjust as needed)
  key_name      = "TASK2"     // Replace with your Ubuntu key pair name without .pem extension

  tags = {
    Name = "StrapiServer"
  }

  // Provisioner block to run remote commands on the EC2 instance after creation
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nodejs npm",
      "sudo npm install -g yarn pm2",
      "git clone https://github.com/madhusudhan1909/strapi.git /srv/strapi",
      "cd /srv/strapi && yarn install",
      "cd /srv/strapi && pm2 start yarn --name strapi -- start",
      "pm2 startup systemd",
      "pm2 save"
    ]

    // Connection block specifies SSH connection details to the EC2 instance
    connection {
      type        = "ssh"
      user        = "ubuntu"   // Ubuntu user for SSH access
      private_key = file("/home/ubuntu")  // Replace with the path to your TASK2.pem private key
      host        = aws_instance.strapi.public_ip  // Uses the instance's public IP dynamically
    }
  }

  lifecycle {
    create_before_destroy = true  // Ensures the new instance is created before the old one is destroyed
  }

  // Local-exec provisioner to output the public IP of the created instance
  provisioner "local-exec" {
    command = "echo ${aws_instance.strapi.public_ip}"
  }
}

output "instance_ip" {
  value = aws_instance.strapi.public_ip  // Outputs the public IP of the EC2 instance
}
