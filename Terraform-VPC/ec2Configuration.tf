data "aws_subnet" "public_subnet_1"{
    filter {
        name = "tag:Name"
        values = ["Public-Subnet: Subnet 1"]
    }

    depends_on = [
        aws_route_table_association.public_subnet_association
    ]
}

# resource "tls_private_key" "tls_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "generated_key" {
#   key_name   = var.key_name
#   public_key = tls_private_key.tls_key.public_key_openssh
# }

resource "aws_instance" "EC2-Terraform_Project"{
    ami = "ami-02a66cf05465c373f"
    instance_type = "t2.micro"
    tags = {
        Name = "Terraform Assignment: EC2"
    }
    key_name = var.key_name
    user_data = file("userData.sh")
    subnet_id = data.aws_subnet.public_subnet_1.id
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    associate_public_ip_address = true

    # provisioner "remote-exec" {
    #     inline = [
    #     "sudo yum update -y",
    #     "sudo amazon-linux-extras install nginx1.12 -y",
    #     "sudo service nginx start",
    #     "sudo chkconfig nginx on"
    #     ]
    # }
}

# output "SSH_output" {
#     value = "ssh -i bash_key.pem ec2-user@${aws_instance.Terraform_Assignment_EC2.public_ip}"
# }