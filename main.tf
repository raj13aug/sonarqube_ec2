# Declaring the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-focal-20.04-amd64-server-*"]
  }

}

resource "aws_instance" "Sonarqube" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  user_data     = file("sonar_script.sh")

  tags = {
    Name = "Sonarqube_Instance"
  }
}