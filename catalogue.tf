resource "aws_instance" "catalogue" {
  ami     = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09a30c40cfd8547e6"]

  tags = {
    Name = "catalogue"
  }
}


resource "aws_route53_record" "catalogue" {
  zone_id = "Z07420703D2F2QO6YXFHV"
  name    = "catalogue-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.catalogue.private_ip]
}