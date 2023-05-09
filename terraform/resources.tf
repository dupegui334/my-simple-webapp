resource "aws_instance" "ec2-webapp" {
  ami = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  tags = {
    Name = "webserver-app-tf"
    Description = "Flask app server on Ubuntu"
  }
}

