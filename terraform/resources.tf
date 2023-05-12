resource "aws_instance" "ec2-webapp" {
  ami           = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver-app-tf"
    Description = "Flask app server on Ubuntu"
  }
  key_name               = data.aws_key_pair.web-app-key.key_name
  vpc_security_group_ids = [data.aws_security_group.app-sg.id]
}

resource "local_file" "ansible_inventory" {
  depends_on = [aws_instance.ec2-webapp]

  content = <<-EOT
    [webserver]
    ec2-webapp ansible_host="${aws_instance.ec2-webapp.public_ip}" ansible_user="ec2-user"
    EOT

  filename = "../ansible/inventory"
}

data "aws_key_pair" "web-app-key" {
  key_name = "centos-ec2"
}

data "aws_security_group" "app-sg" {
  id = "sg-07355b7f88fa76532"
}

output "publicip" {
  value = aws_instance.ec2-webapp.public_ip
}
