variable "app_alb_name" {
  type    = string
  default = "app-tier-alb"
}

variable "app_target_group_name" {
  type    = string
  default = "app-tier-tg"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "app_sg_id" {
  type = string
}
