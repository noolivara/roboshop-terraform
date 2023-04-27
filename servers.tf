data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

resource "aws_instance" "frontend" {
  ami           = aws_instance.frontend.public_ip
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}


resource "aws_instance" "mongodb" {
  ami           = aws_instance.frontend.public_ip
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}
resource "aws_instance" "catalogue" {
  ami           = aws_instance.frontend.public_ip
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}




