terraform {
  backend "s3" {
    bucket         = "s3-bucket-codenine-tfstate" # S3 버킷 이름
    key            = "eb-ddakzip-server/terraform.tfstate" # tfstate 저장 경로
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-tfstate-lock" # dynamodb table 이름
  }
}

provider "aws" {}

provider "aws" {
  alias   = "virginia"
  region  = "us-east-1"
}