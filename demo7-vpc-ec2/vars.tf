variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-west-2 = "ami-08d70e59c07c61a3a"
  }
}

variable "instance-name" {
  description = "ec2 instance"
  type        = string
  default     = "Varun-vpc-ec2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "varunkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "varunkey.pub"
}