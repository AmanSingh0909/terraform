provider "aws" {
    region = "us-east-1"
}

provider "vault" {
    address = "http://ec2-ipaddress:8200"
    skip_child_token = true

    auth_login {
        path = "auth/approle/login"

        parameters = {
            role_id = "a04adb1-9c8e-4c3a-9f0e-1b2c3d4e5f6g"
            secret_id = "12345678-90ab-cdef-1234-567890abcdef"
        }
    }
}

data "vault_kv_secret_v2" "example" {
    mount = "kv"
    name = "test-secret"
}

resource "aws_instance" "example" {
    ami = "ami-0c94855ba95c71c99"
    instance_type = "t3.micro"

    tags = {
        secret = data.vault_kv_secret_v2.example.data["username"]
    }
}