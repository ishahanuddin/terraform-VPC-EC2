resource "aws_route_table_association" "public_subnet_association"{
    count = length(var.public_subnet_CIDR)
    depends_on = [aws_subnet.terraform_assignment_public_subnets, aws_route_table.terraform_assignment_public_route_table]
    subnet_id = element(aws_subnet.terraform_assignment_public_subnets[*].id, count.index)
    route_table_id = aws_route_table.terraform_assignment_public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association"{
    count = length(var.private_subnet_CIDR)
    depends_on = [aws_subnet.terraform_assignment_private_subnets, aws_route_table.terraform_assignment_private_route_table]
    subnet_id = element(aws_subnet.terraform_assignment_private_subnets[*].id, count.index)
    route_table_id = aws_route_table.terraform_assignment_private_route_table[count.index].id
}
