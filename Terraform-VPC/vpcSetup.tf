resource "aws_vpc" "main"{
    cidr_block = var.vpc_CIDR
    tags = {
        Name = "VPC: terraform-assignment"
    }
}
