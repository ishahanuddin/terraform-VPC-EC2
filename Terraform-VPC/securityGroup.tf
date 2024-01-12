resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow incoming traffic on ports 22 (SSH) and 80 (HTTP)"

  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = "Outbound rules"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  vpc_id = aws_vpc.main.id
  depends_on = [aws_vpc.main]

  tags = {
    Name = "SG: Terraform Assignment"
  }
}
