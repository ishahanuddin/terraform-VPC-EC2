resource "aws_subnet" "terraform_assignment_public_subnets"{
    count = length(var.public_subnet_CIDR)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnet_CIDR, count.index)
    availability_zone = element(var.availability_zones_eu, count.index)


    tags = {
        Name = "Public-Subnet: Subnet ${count.index + 1}"
    }

}

resource "aws_subnet" "terraform_assignment_private_subnets"{
    count = length(var.private_subnet_CIDR)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_CIDR, count.index)
    availability_zone = element(var.availability_zones_eu, count.index)


    tags = {
        Name = "Private-Subnet: Subnet ${count.index + 1}"
    }

}