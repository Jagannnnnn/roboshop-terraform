resource "aws_instance" "mongodb" {
  ami     = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09a30c40cfd8547e6"]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z07420703D2F2QO6YXFHV"
  name    = "mongodb-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.mongodb.private_ip]
}