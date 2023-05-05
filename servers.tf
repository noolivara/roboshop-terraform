data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}


resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}

resource "aws_instance" "instances" {
  count = length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instancetype

  tags = {
    Name = var.components[count.index]
  }
}





