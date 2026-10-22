
variable "aws_region" {
  description = "AWS region for the lab"
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "Unique Halloween gallery S3 bucket name"
  type        = string
  default     = "tsi-halloween-gallery-ilja-2026"
}
