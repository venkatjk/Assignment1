terraform {
backend "s3" {
	   #bucket = "cms-venkat-tfstate"
     key    = "cmsdeploy.tfstate"
     region = "eu-west-2"
  }
}