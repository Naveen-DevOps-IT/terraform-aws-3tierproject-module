# Terraform AWS 3-Tier Project (Modular Structure)

This repository contains reusable Terraform modules for deploying a full AWS 3-tier architecture:

-  VPC, Subnets (Public & Private)
-  NAT Gateway, Route Tables, IGW
-  Security Groups ( 2 web, 2 app , 2 db )
-  Web & App ASG + ALBs
-  RDS (MySQL)
-  S3 for backups/logs
-  3 iam users

  [Architecture] (graphviz.png)

> Infrastructure is defined using clean, isolated modules for reusability.

note - add variable.tf file in the root module and edit the main.tf by creating few requried variables and declare this variables in the varaible.tf file.
