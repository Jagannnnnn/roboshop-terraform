variable "vpc_security_group_ids" {
  default = "sg-09a30c40cfd8547e6"
}
variable "instances" {
  default = {
    frontend = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t3.micro"
    }
    catalogue = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t3.micro"

    }
    mongodb = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t3.small"
    }

  }
}

variable "zone_id" {
  default = "Z07420703D2F2QO6YXFHV"
}
variable "env" {
  default = "dev"
}