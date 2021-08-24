resource "aws_instance" "test" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

      tags = {
    Name = var.instance-name
  }
}