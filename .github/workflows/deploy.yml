provider "aws" {
  region = "ap-southeast-1"  // Specify your AWS region
}

# Define the existing instance
resource "aws_instance" "existing_instance" {
  filter {
    name   = "tag:Name"
    values = ["srv-strapi"]  // Replace with your instance name tag
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"  // Replace with your SSH user on the instance
    private_key = file("/path/to/your/private_key.pem")  // Replace with the path to your private key
    host        = aws_instance.existing_instance.public_ip  // Use the instance's public IP address
  }

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
  }

  // Specify any other required configurations like instance type, tags, etc.
  instance_type = "t2.micro"  // Replace with your instance type if different

  tags = {
    Name = "srv-strapi"
  }
}

output "instance_ip" {
  value = aws_instance.existing_instance.public_ip  // Output the public IP of the existing instance
}
