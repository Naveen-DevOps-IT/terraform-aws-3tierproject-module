variable "vpc-name" {
  type    = string
  default = "my-main-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/24"
}