provider "aws" {
  region = "ap-southeast-1"  // Specify your AWS region
}

# Define the EC2 instance
resource "aws_instance" "strapi_instance" {
  ami             = "ami-003c463c8207b4dfa"  // Ubuntu 24.04 AMI ID
  instance_type   = "t2.medium"    // Instance type
  key_name        = "TASK2"  // Replace with your key pair name

  subnet_id       = "subnet-07a588e36ae9c9143"  // Specify your subnet ID
  vpc_security_group_ids = ["sg-0dd882da58c7d696b"]  // Replace with your security group ID

  tags = {
    Name = "srv-strapi"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"  // Replace with your SSH user on the instance
    private_key = file("/home/ubuntu")  // Replace with the correct path to your .pem file
    host        = self.public_ip  // Use the instance's public IP address
  }
}

output "instance_public_ip" {
  value = aws_instance.strapi_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.strapi_instance.private_ip
}
