resource "aws_instance" "Webserver" {
  count = 3
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  tags = {
  Name = "Web-${count.index+1}"
  }
}