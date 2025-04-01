module "ec2" {
  for_each = var.instances
  source = "./modules/ec2"

  ami_id = each.value["ami_id"]
  env    = var.env
  instance_type = each.value["instance_type"]
  name = each.key
  zone_id = var.zone_id


}


# resource "null_resource" "catalogue" {
#   provisioner "remote-exec" {
#
#     connection {
#       type     = "ssh"
#       user     = "ec2-user"
#       password = "DevOps321"
#       host     = aws_instance.catalogue.private_ip
#     }
#     inline = [
#       " sudo pip3.11 install ansible",
#       "ansible-pull -i localhost, -U https://github.com/Jagannnnnn/roboshop-ansible2.git roboshop.yml -e component_name=catalogue -e env-dev",
#     ]
#    }
#
# }