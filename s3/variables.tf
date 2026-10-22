
variable "aws_region" {
  description = "AWS region for the Halloween lab"
  type        = string
  default     = "eu-north-1"
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
  default     = "tsi-halloween-gallery-ilja-2026"
}

variable "trusted_role_arn" {
  description = "IAM role allowed to assume the Halloween roles"
  type        = string
  default     = "arn:aws:iam::704516099123:role/managed/AccountFullAccessRole"
}
