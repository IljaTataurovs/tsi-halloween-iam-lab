
# Halloween Gallery - Terraform Outputs

output "bucket_name" {
  description = "Halloween S3 gallery bucket name"
  value       = aws_s3_bucket.gallery.id
}

output "bucket_arn" {
  description = "Halloween S3 gallery ARN"
  value       = aws_s3_bucket.gallery.arn
}

output "ghost_role_arn" {
  description = "Ghost read-only IAM role ARN"
  value       = aws_iam_role.ghost.arn
}

output "witch_role_arn" {
  description = "Witch upload/delete IAM role ARN"
  value       = aws_iam_role.witch.arn
}

output "zombie_role_arn" {
  description = "Zombie object management IAM role ARN"
  value       = aws_iam_role.zombie.arn
}

output "aws_region" {
  description = "AWS region used for the lab"
  value       = var.aws_region
}
