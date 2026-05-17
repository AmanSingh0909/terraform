terraform {
  backend "s3" {
    bucket = "terra-aman-bitbucket"
    region = "us-east-1"
    key = "terra/terraform.tfstate"
    # dynamodb_table = "terraform_lock"
  }
}