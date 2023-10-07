provider "aws" {
  region= "us-east-2"
}
resource "aws-instance" "example" {
  ami="ami-0aec300fa613b1c92"
  instance_type= "t2.micro"
  tags={
      Name= "Sai-Server1"
  }
}
