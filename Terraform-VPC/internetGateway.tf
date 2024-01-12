resource "aws_internet_gateway" "internet_gateway_public"{
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "Internet Gateway: Terraform Assignment"
    }
}