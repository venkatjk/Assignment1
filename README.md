## Purpose
CMS Application - Terraform Infrastructure

## Pre-requisite
```console
   1. We should have AWS access key and secret key to run this terraform code( Configure using aws cli manually or set it at ~/.aws/credentials)
   2. AWS CLI and Terraform(v12.0.0) installed on your laptop
   3. VPC, 2 Subnets,Routing Table, Security Groups,KeyPairs,S3 bucket (tfstate) ,DynamoDB(tfstate lock) created already.
   
 ```  
## To develop the infrastructure code for CMS Application.
  Wordpress is chosen as an example for this demonstration
  
## Usage
```console
   Clone the repo locally into your system prefarably into XXX direcoty in c drive and make sure you have all pre-requisites setup.
```    
## Execute
```console
     terraform init --var-file="XXX\env\dev.tfvars" --
     terraform plan --var-file="XXXX\env\dev.tfvars"
     terraform apply --var-file="XXXX\env\dev.tfvars"
```
## The CMS must be backed by a relational database.
```console
  1. RDS Mysql is considered for relational database and this code is defined in modules/rds folder main.tf file. 
  2. The values for the variables defined in the main.tf are declared and  initialized in modules/rds/ variables.tf file. 
  3. The DB endpoint is captured in output.tf defined in modules/rds folder.
  ```
## Scalability and fault tolerance should be an important consideration of your design.
```console
  1. Autoscaling group is used to create the ec2 resource, so that it always make sure there 1 instance running as per our definitions in variables.tf in asg module.
  Used AMI from marketplace to configure ASG.
  2. Template is defined for userdata to install mysql client, httpd server, wordpress and passing sql file inside template file to create user in mysql. The userdata is defined in modules/asg/user_data.tpl 
  3. Following Blue/Green deployment method by adding create_before_destroy = true statement in cms_ag.tf file. So this will ensure for any reason the running instance is unhealthy there will be new ec2 instance created and started and until the new ec2 instance is healthy the current ec2 won't terminate.
  4. cms_dns.tf present under modules/dns will created the A record in the hosted zone and dns name name is captured as output in output.tf file.
 ``` 
## Reusability of the terraform module should be part of the design.
```console
  1. Modules allows us to separate our Terraform files into manageable groups. There are various benefits to this such as to better organised file structure, and the ability to focus Terraform apply to a reduced scope. 
  2. In this demonstration we can see 3 modules present under modules folder. 
 ``` 
## Provide a testing strategy for the terraform module.
```console
  Please refer Terraform-Compliance repo for the detailed explanation as i created separate repo for this.
```
