variable "db_identifier" {
  default = "my-db"
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Admin123456"
  sensitive = true
}

variable "db_subnet_group_name" {
  default = "mysql-subnet-group"
}

variable "db_subnet_ids" {
  type = list(string)
}

variable "db_sg_id" {
  type = string
}
