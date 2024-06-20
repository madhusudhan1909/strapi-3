 provider "aws" {
  region = "ap-southeast-1"
  access_key = var.AKIAXYKJQKV66YCZSSMU
  secret_key = var.uiEFUHBwVnMMVE8lOQQSVG1mULR2We12jFwhV1mI
}


# Define the EC2 instance
resource "aws_instance" "strapi_instance" {
  ami             = "ami-003c463c8207b4dfa"  // Update with your Ubuntu 20.04 AMI ID
  instance_type   = "t2.large"
  key_name        = "TASK2"  // Replace with your key pair name

  subnet_id       = "subnet-0ba5354c77b6d001f"  // Update with your subnet ID
  vpc_security_group_ids = ["sg-0795d88eba4e1b125"]  // Update with your security group ID

  tags = {
    Name = "srv-strapi"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/ubuntu/TASK2.pem")  // Update with correct path to your .pem file
    host        = "13.212.240.236"  // Ensure this is the correct public IP address of your instance
  }
}

output "instance_public_ip" {
  value = aws_instance.strapi_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.strapi_instance.private_ip
}
