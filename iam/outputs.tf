
output "ghost_role_arn" {
  value = aws_iam_role.ghost.arn
}

output "witch_role_arn" {
  value = aws_iam_role.witch.arn
}

output "zombie_role_arn" {
  value = aws_iam_role.zombie.arn
}

output "gallery_bucket_arn" {
  description = "Target bucket ARN; bucket is not created here"
  value       = local.gallery_bucket_arn
}

