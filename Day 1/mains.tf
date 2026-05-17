provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-06d4892cdcf1d2cf7"
    instance_type = "t3.micro"
}