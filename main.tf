#Create backend S3

terraform {
  backend "s3" {
    bucket = "terraform-raphael-s3"
    key    = "dev/terraform.tfstate"
    region = "us-west-2"
    profile = "Terraform-aws"
  }
}
