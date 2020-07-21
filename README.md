# Purpose
CMS Application - Terraform Infrastructure

# Pre-requisite
```console
   We should have AWS access key and secret key to run this terraform code<br>
   VPC,Subnets,Routing Table, Internet Gateway already existing<br>
   AWS CLI and Terraform installed on your laptop<br>
 ```  
# To develop the infrastructure code for CMS Application.
  Wordpress is chosen as an example for this demonstration
  
# Usage
   -> Clone the repo locally into your system prefarably into demo direcoty in c drive and make sure you have all pre-requisites setup.
# Execute
```console
     terraform init --var-file="C:\demo\env\dev.tfvars"<br>
     terraform plan --var-file="C:\demo\env\dev.tfvars"<br>
     terraform apply --var-file="C:\demo\env\dev.tfvars"<br>
```
# The CMS must be backed by a relational database.
```console
  RDS Mysql is considered for relational database and this code is defined in modules/rds folder main.tf file. <br>
  The values for the variables defined in the main.tf are declared and  initialized in modules/rds/ variables.tf file. <br>
  The DB endpoint is captured in output.tf defined in modules/rds folder.
  ```
## Scalability and fault tolerance should be an important consideration of your design.
```console
 -  Autoscaling group is used to create the ec2 resource, so that it always make sure there 1 instance running as per our definitions in variables.tf in asg module.<br>
  Used AMI from marketplace to configure ASG.<br>
  Template is defined for userdata to install mysql client, httpd server, wordpress and passing sql file inside template file to create user in mysql. The userdata is defined in modules/asg/user_data.tpl <br>
  Following Blue/Green deployment method by adding create_before_destroy = true statement in cms_ag.tf file. So this will ensure for any reason the running instance is unhealthy there will be new ec2 instance created and started and until the new ec2 instance is healthy the current ec2 won't terminate.<br>
  cms_dns.tf present under modules/dns will created the A record in the hosted zone and dns name name is captured as output in output.tf file.<br>
 ``` 
# Reusability of the terraform module should be part of the design.
```console
  Modules allows us to separate our Terraform files into manageable groups. There are various benefits to this such as to better organised file structure, and the ability to focus Terraform apply to a reduced scope. In this demonstration we can see 3 modules present under modules folder. 
 ``` 
# Provide a testing strategy for the terraform module.
```console
  Please refer Terraform-Compliance repo for the detailed explanation as i created separate repo for this.
```
