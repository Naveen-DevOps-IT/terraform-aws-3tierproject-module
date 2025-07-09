variable "alb_name" {
  type    = string
  default = "web-alb"
}

variable "target_group_name" {
  type    = string
  default = "web-tg"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "web_sg_id" {
  type = string
}
