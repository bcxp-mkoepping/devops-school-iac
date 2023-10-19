// TODO
variable "ec2_instance_type" {
  description = "TODO"
  type        = string
  default     = "t3.micro"
}

// TODO
data "aws_ami" "someones_ubuntu_image" {

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  // TODO: required
  owners = ["099720109477"]

  // TODO: optional
  most_recent = true
}

// TODO
resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.someones_ubuntu_image.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

// TODO
output "my_instance_arn" {
  value = aws_instance.my_instance.arn
}