variable "vpc_CIDR" {
  type        = string
  description = "VPC CIDR VALUE"
  default     = "10.0.0.0/16"
}

variable "public_subnet_CIDR"{
    type = list(string)
    description = "CIDR values for public subnet"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_CIDR"{
    type = list(string)
    description = "CIDR values for private subnet"
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones_eu"{
    type = list(string)
    description = "Avalaibility zones"
    default = ["eu-west-1a", "eu-west-1b"]
}

variable "key_name"{
    type = string
    description = "Key name for key pair"
    default = "bash_key"
}