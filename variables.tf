variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  default = "t3.small"
}
variable "vpc_security_group_ids" {
  default = "sg-09a30c40cfd8547e6"
}
variable "instances" {
  default = [
  "catalogue",
    "frontend",
    "mongodb"
  ]
}

variable "zone_id" {
  default = "Z07420703D2F2QO6YXFHV"
}
variable "env" {
  default = "dev"
}