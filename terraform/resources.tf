resource "aws_instance" "ec2-webapp" {
  ami           = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver-app-tf"
    Description = "Flask app server on Ubuntu"
  }
  key_name               = data.aws_key_pair.web-app-key.key_name
  vpc_security_group_ids = [aws_security_group.app-sg.id]
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

resource "aws_security_group" "app-sg" {
  name = "web-app-sg"
  description = "Security group for web app host"
  vpc_id = "vpc-0578411bba348a4f3"

  ingress {
    description      = "SSH connection"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "container port"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

output "publicip" {
  value = aws_instance.ec2-webapp.public_ip
}
