resource "aws_key_pair" "key_pair" {
  key_name   = "host1-key"
  public_key = var.public_key  # Update the key in the.tfvars file
}

# Launch an EC2 instance
resource "aws_instance" "the_instance" {
  ami           = "ami-016b30666f212275a"  # Change this to your desired AMI ID
  instance_type = "t3.micro"  # Change this to your desired instance type

  key_name      = aws_key_pair.key_pair.key_name

  tags = {
    Name = "Ansible-1"
  }

  #ass
  provisioner "local-exec" {
    command = <<-EOT
      echo "host1 ansible_host=${aws_instance.the_instance.public_dns}" >> /etc/ansible/hosts
    EOT
  }

  lifecycle {
    ignore_changes = [
      key_name,
    ]
  }
}
