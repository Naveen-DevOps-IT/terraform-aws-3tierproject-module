variable "pubsubnet-cidr" {
  type        = list(string)
  default     = ["10.0.0.0/27", "10.0.0.32/27"]
}

variable "pubsubnet-az" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Availability zones for the public subnets
}

variable "vpc_id" {
  type = string
}