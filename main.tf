
module "vpc" {
  source = "./modules/vpc-module"
}

module "public_subnet" {
  source  = "./modules/pub-subnet-module"
  vpc_id  = module.vpc.vpc_id  # required, no default
}

module "private_subnet" {
  source  = "./modules/pvt-subnet-module"
  vpc_id  = module.vpc.vpc_id
}

module "igw" {
  source  = "./modules/igw-module"
  vpc_id  = module.vpc.vpc_id
}

module "nat_gateway" {
  source            = "./modules/nat-gw-module"
  public_subnet_id  = module.public_subnet.public_subnet_ids[0]  # nat attach to FIRST PUBLIC SUBNET
}

module "route_table" {
  source              = "./modules/routetable-module"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.igw.igw_id
  nat_gw_id           = module.nat_gateway.nat_gateway_id
  public_subnet_ids   = module.public_subnet.public_subnet_ids
  private_subnet_ids  = module.private_subnet.private_subnet_ids
}

module "security_groups" {
  source  = "./modules/security-group-module"
  vpc_id  = module.vpc.vpc_id
}

module "web_alb" {
  source             = "./modules/web-alb-module"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.public_subnet.public_subnet_ids
  web_sg_id          = module.security_groups.web_sg_id
}

module "app_alb" {
  source              = "./modules/app-alb-module"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids = [
  module.private_subnet.private_subnet_ids[0], # us-east-1a
  module.private_subnet.private_subnet_ids[1]  # us-east-1b
]
  app_sg_id           = module.security_groups.app_sg_id
}

module "web_asg" {
  source            = "./modules/web-asg-module"
  ami_id            = "ami-020cba7c55df1f615"  #  ubuntu 20.04 LTS
  instance_type     = "t2.micro"
  key_name          = "mysecond"          # Your SSH Key
  web_sg_id         = module.security_groups.web_sg_id
  public_subnet_ids = module.public_subnet.public_subnet_ids
  target_group_arn  = module.web_alb.target_group_arn

  min_size          = 1
  max_size          = 3
  desired_capacity  = 2
}


module "app_asg" {
  source              = "./modules/app-asg-module"
  ami_id              = "ami-0c02fb55956c7d316"  # Amazon Linux 2
  instance_type       = "t2.micro"
  key_name            = "mysecond"

  app_sg_id           = module.security_groups.app_sg_id
 private_subnet_ids = [
  module.private_subnet.private_subnet_ids[0], # us-east-1a
  module.private_subnet.private_subnet_ids[1]  # us-east-1b
]
  target_group_arn    = module.app_alb.app_target_group_arn

  min_size            = 1
  max_size            = 3
  desired_capacity    = 2
}

module "rds_mysql" {
  source            = "./modules/rds-module"
  db_subnet_ids     = [module.private_subnet.private_subnet_ids[2], module.private_subnet.private_subnet_ids[3]]
  db_sg_id          = module.security_groups.db_sg_id
  #overiding the default values of rds-module/variable.tf
  db_identifier     = "mysql-db"
  db_instance_class = "db.t3.micro"
  db_username       = "admin"
  db_password       = "Adminuncleis23456" # Or use tfvars or env variables for sensitive data
}

module "s3_bucket" {
  source     = "./modules/s3-module"
}

module "iam_users" {
  source = "./modules/iam-module"
}