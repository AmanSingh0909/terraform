provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                                  = "ami-091138d0f0d41ff90"
  instance_type                        = "t3.micro"
  availability_zone                    = "us-east-1b"
  subnet_id                            = "subnet-0dc23b2ff3b013cd0"
  key_name                             = "valt-key"

  # Network
  associate_public_ip_address          = true          # ✅ Only works WITHOUT primary_network_interface
  vpc_security_group_ids               = ["sg-0afac108579155476"]  # ✅ Use this inside a VPC
  private_ip                           = "172.31.81.129"
  source_dest_check                    = true
  secondary_private_ips                = []

  # Instance behavior
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  hibernation                          = false
  monitoring                           = false
  instance_initiated_shutdown_behavior = "stop"
  get_password_data                    = false
  user_data_replace_on_change          = false         # ✅ Must be bool, not null
  tenancy                              = "default"

  tags = {
    Name = "test"
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  enclave_options {
    enabled = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  # ✅ primary_network_interface block REMOVED — incompatible with above network args

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
    tags                  = {}
  }
}


# import {

#     to = aws_instance.example
    
#     id = "i-0be8e587482f15fcc"
# }

# terraform plan "-generate-config-out=generated_resources.tf"