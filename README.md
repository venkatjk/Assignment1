# Purpose
CMS Application - Terraform Infrastructure

# Pre-requisite
   -> We should have AWS access key and secret key to run this terraform code<br>
   -> VPC,Subnets,Routing Table, Internet Gateway already existing<br>
   -> AWS CLI and Terraform installed on your laptop<br>
   
# To develop the infrastructure code for CMS Application.
  Wordpress is choses as an example for this demonstration
  
# Usage
   -> Clone the repo locally into your system prefarably into demo direcoty in c drive and make sure you have all pre-requisites setup.
# Execute
   ->   terraform init --var-file="C:\demo\env\dev.tfvars"<br>
   ->   terraform plan --var-file="C:\demo\env\dev.tfvars"<br>
   ->   terraform apply --var-file="C:\demo\env\dev.tfvars"<br>

# The CMS must be backed by a relational database.

# Scalability and fault tolerance should be an important consideration of your design.
# Reusability of the terraform module should be part of the design.
# Provide a testing strategy for the terraform module.
