provider "aws" {
  region = "ap-southeast-1"  // Specify your AWS region
}

# Define the existing instance
resource "aws_instance" "existing_instance" {
  instance_id = "i-02c15d7aaf5647f08"  // Replace with your actual instance ID

  connection {
    type        = "ssh"
    user        = "ubuntu"  // Replace with your SSH user on the instance
    private_key = file("home/ubuntu")  // Replace with the path to your private key
    host        = "13.213.36.79"  // Use the instance's public IP address
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

  // Specify any other required configurations like tags if necessary
  tags = {
    Name = "ExistingInstance"
  }
}

output "instance_ip" {
  value = aws_instance.existing_instance.public_ip  // Output the public IP of the existing instance
}
