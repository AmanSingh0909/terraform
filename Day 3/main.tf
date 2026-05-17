provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "terra" {
    ami = "ami-06d4892cdcf1d2cf7"
    instance_type = "t3.micro"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "terra-aman-bitbucket593"
}

# resource "aws_dynamodb_table" "terraform_lock" {
#     name = "terraform-lock"
#     billing_mode = "PAY_PER_REQUEST"
#     hash_key = "LockID"

#     attribute {
#       name = "LockID"
#       type = "S"
#     }
# }