resource "aws_instance" "frontend" {
  ami     = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09a30c40cfd8547e6"]

  tags = {
    Name = "frontend"
  }
}