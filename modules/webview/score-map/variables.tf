variable "domain_name" {
    type        = string
    default     = "codenine.shop"
    description = "Domain name to deploy Web services"
}

variable "bucket_name" {
    type        = string
    default     = "s3-bucket-ddakzip-webview-score-map"
    description = "Bucket name for S3"
}
