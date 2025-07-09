variable "pvtsubnet-cidr" {
  type    = list(string)
  default = ["10.0.0.64/27","10.0.0.96/27","10.0.0.128/27","10.0.0.160/27"]
}

variable "pvtsubnet-az" {
  type    = list(string)
  # Availability zones for the private subnets
  # These should be different from the public subnets to ensure high availability 
  default = ["us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b"] 
}

variable "vpc_id" {
  type = string
}
