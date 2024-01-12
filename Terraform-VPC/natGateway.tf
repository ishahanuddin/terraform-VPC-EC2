resource "aws_eip" "elasticIPForNAT"{
    count = length(var.private_subnet_CIDR)
    vpc = true
}

resource "aws_nat_gateway" "nat_gateway_private"{
    count = length(var.private_subnet_CIDR)
    depends_on = [aws_eip.elasticIPForNAT]
    allocation_id = aws_eip.elasticIPForNAT[count.index].id
    subnet_id = aws_subnet.terraform_assignment_private_subnets[count.index].id

    tags = {
        Name = "NAT Gateway: Terraform Assignment"
    }
}

