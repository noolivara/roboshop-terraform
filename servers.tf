//resource "aws_instance" "frontend" {
  //ami           = data.aws_ami.centos.image_id
  //instance_type = "t3.micro"
  //vpc_security_group_ids = [data.aws_security_group.selected.id]

  //tags = {
    //Name = "frontend"
 // }
//}

resource "aws_route53_record" "records" {
  zone_id = "Z03986262CQPCHNJNZM9L"
  name    = "${var.components[count.index]}-dev.rdevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances.private_ip]
}

resource "aws_instance" "instances" {
  count = length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instancetype
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name = var.components[count.index]
  }
}





