resource "aws_key_pair" "key" {
  key_name   = "key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami                    = var.AMIS[var.AWS_REGION]
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key.key_name
  subnet_id              = aws_subnet.subnet-public-1.id
  vpc_security_group_ids = ["${aws_security_group.varun-security-group.id}"]

  tags = {
    Name = var.instance-name
  }
}