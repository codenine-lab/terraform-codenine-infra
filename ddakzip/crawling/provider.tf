provider "aws" {}

terraform {
  backend "s3" {
    bucket         = "s3-bucket-ddakzip-tfstate" # S3 버킷 이름
    key            = "crawling/terraform.tfstate" # tfstate 저장 경로
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-tfstate-lock" # dynamodb table 이름
  }
}
