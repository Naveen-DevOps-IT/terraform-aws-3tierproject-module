variable "eip-name" {
  type        = string
  default     = "main-eip"
}

variable "nat-gw-name" {
  type        = string
  default     = "main-nat-gw" 
}

variable "public_subnet_id" {
  type = string
}