provider "aws" {
  region = "ap-southeast-1"
}

variable "private_key" {
  description = "The private key for SSH access"
  type        = string
  sensitive   = true
}

resource "aws_instance" "strapi_instance" {
  ami                    = "ami-003c463c8207b4dfa"  # Update with your Ubuntu 20.04 AMI ID
  instance_type          = "t2.medium"
  subnet_id              = "subnet-0ba5354c77b6d001f"  # Update with your subnet ID
  key_name               = "TASK2"  # Replace with your key pair name
  vpc_security_group_ids = ["sg-0795d88eba4e1b125"]  # Update with your security group ID

  tags = {
    Name = "srv-strapi"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nodejs npm",
      "sudo npm install -g pm2",
      "git clone https://github.com/PearlThoughts-DevOps-Internship/strapi.git /srv/strapi",
      "cd /srv/strapi/examples/getstarted",
      "npm install",
      "pm2 start npm -- start"
    ]
  }
}

output "instance_public_ip" {
  value = aws_instance.strapi_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.strapi_instance.private_ip
}
