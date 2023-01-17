variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "Terraform_vpc"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "az_zone1" {
  default = "us-east-2a"
}

variable "pub_subnet_name" {
  default = "Terraform_public_subnet"
}

variable "pri_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "pri_subnet_name" {
  default = "Terraform_private_subnet"
}

variable "vpc_id" {
}

variable "pub_subnet_cidr" {
  default = "10.0.3.0/24"
}

variable "pub_subnet_name_2" {
  default = "Terraform_public_subnet_2"
}

variable "az_zone2" {
  default = "us-east-2b"
}

variable "pri_subnet_name2" {
  default = "Terraform_private_subnet_2"
}

variable "pri_subnet_cidr2" {
  default = "10.0.4.0/24"
}


