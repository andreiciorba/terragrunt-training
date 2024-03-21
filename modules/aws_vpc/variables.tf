variable "region_name" {
  default = "eu-west-3"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "environment" {
  default = "test"
}

variable "public_subnet_cidrs" {
  default = ["10.10.0.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.10.1.0/24", "10.10.3.0/24"]
}

variable "azs" {
  type = list(string)
  default = ["eu-west-3a", "eu-west-3b"]
}