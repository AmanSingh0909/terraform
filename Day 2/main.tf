provider "aws" {
   region = "us-east-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-06d4892cdcf1d2cf7"
    instance_type_value = "t3.micro"
}