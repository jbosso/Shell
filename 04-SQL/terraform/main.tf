provider "aws" {
  region = "sa-east-1"
}

# Dev

resource "aws_instance" "mysql_instance-dev" {
  subnet_id = "${var.subnetPrivada}"
  ami = "${var.amiId}"
  instance_type = "t2.large"
  key_name = "${var.keyPrivate}"
  root_block_device {
    encrypted = true
    volume_size = 20
  }
  tags = {
    Name = "mysql-teste"
  }
  vpc_security_group_ids = ["sg-02c0330544466dd1d"]
}

# Variaveis

variable "vpcId" {
  type        = string
}

variable "amiId" {
  type        = string
}

variable "subnetPrivada" {
  type        = string
}

variable "keyPrivate" {
  type        = string
}

# Outputs

output "output-mysql-dev" {
  value = [
    "mysql_instance_dev ${aws_instance.mysql_instance-dev.private_ip}"
  ]
}