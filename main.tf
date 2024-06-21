provider "aws" {
  region = "ap-southeast-1"
}

data "aws_instance" "existing_instance" {
  instance_id = "i-071170ba4826f6150"  // Your existing instance ID
}

output "instance_public_ip" {
  value = data.aws_instance.existing_instance.public_ip
}

output "instance_private_ip" {
  value = data.aws_instance.existing_instance.private_ip
}
