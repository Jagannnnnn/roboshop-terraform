resource "aws_instance" "frontend" {
  ami     = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "frontend"
  }

  # provisioner "remote-exec" {
  #
  #   connection {
  #     type     = "ssh"
  #     user     = "ec2-user"
  #     password = "DevOps321"
  #     host     = self.public_ip
  #   }
  #   inline = [
  #     " sudo pip3.11 install ansible",
  #     "ansible-pull -i localhost, -U https://github.com/Jagannnnnn/roboshop-ansible2.git roboshop.yml -e component_name=frontend -e env=dev",
  #   ]
  # }
}




resource "aws_route53_record" "frontend" {
  zone_id = "Z07420703D2F2QO6YXFHV"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.frontend.private_ip]
}

resource "null_resource" "frontend" {
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.frontend.private_ip
    }
    inline = [
      " sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/Jagannnnnn/roboshop-ansible2.git roboshop.yml -e component_name=frontend -e env-dev",
    ]
  }

}
