variable "igw_id" {
  type = string
}

variable "nat_gw_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "rt-name" {
  type    = list(string)
  default = ["public-rt", "private-rt"]
}

variable "vpc_id" {
  type = string
}
