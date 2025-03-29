resource "aws_instance" "frontend" {
  ami     = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09a30c40cfd8547e6"]

  tags = {
    Name = "frontend"
  }
}


provisioner "remote-exec" {

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  inline = [
    " Sudo pip3.11 install ansible",
    "ansible-pull -i localhost, -U https://github.com/Jagannnnnn/roboshop-ansible2.git roboshop.yml -e component_name=frontend -e env=dev",
  ]
}

}

resource "aws_route53_record" "frontend" {
  zone_id = "Z07420703D2F2QO6YXFHV"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.frontend.private_ip]
}