variable "domain_name" {
    type        = string
    default     = "codenine.shop"
    description = "Domain name to deploy Web services"
}

variable "bucket_name" {
    type        = string
    default     = "s3-bucket-ddakzip-webview-real-estate-map"
    description = "Bucket name for S3"
}

variable "s3_domain_name" {
    type        = string
    default     = "s3.map.ddakzip.shop"
    description = "Fully domain name to deploy Web services"
}