resource "aws_route_table" "terraform_assignment_public_route_table"{
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway_public.id
    }

    tags = {
        Name = "Route Table Public: Terraform Assignment"
    }
}

resource "aws_route_table" "terraform_assignment_private_route_table"{
    count = length(var.private_subnet_CIDR)
    vpc_id = aws_vpc.main.id
    depends_on = [aws_nat_gateway.nat_gateway_private]
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_private[count.index].id
    }

    tags = {
        Name = "Route Table Private: Terraform Assignment"
    }
}


