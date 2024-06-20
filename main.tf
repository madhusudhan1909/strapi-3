provider "aws" {
  region = "ap-southeast-1"
}

# Define the EC2 instance
resource "aws_instance" "strapi_instance" {
  ami             = "ami-003c463c8207b4dfa"  // Update with your Ubuntu 20.04 AMI ID
  instance_type   = "t2.medium"
  key_name        = "TASK2"  // Replace with your key pair name

  subnet_id       = "subnet-07a588e36ae9c9143"  // Update with your subnet ID
  vpc_security_group_ids = ["sg-0dd882da58c7d696b"]  // Update with your security group ID

  tags = {
    Name = "srv-strapi"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/ubuntu/TASK2.pem")  // Update with correct path to your .pem file
    host        = self.public_ip
  }
}

output "instance_public_ip" {
  value = aws_instance.strapi_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.strapi_instance.private_ip
}
