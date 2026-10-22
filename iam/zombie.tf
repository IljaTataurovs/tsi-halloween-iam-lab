
# Zombie IAM Role - Manage S3 objects and tags

resource "aws_iam_role" "zombie" {
  name = "tsi-halloween-zombie-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          AWS = var.trusted_role_arn
        }
      }
    ]
  })

  tags = {
    Project = "TSI-Halloween-IAM-Lab"
    Role    = "Zombie"
  }
}

# Customer-managed IAM policy

resource "aws_iam_policy" "zombie_manage" {
  name        = "tsi-halloween-zombie-manage"
  description = "Manage Halloween gallery objects and tags"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "ListGallery"
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = local.gallery_bucket_arn
      },
      {
        Sid    = "ManageGalleryObjects"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging",
          "s3:DeleteObjectTagging"
        ]
        Resource = "${local.gallery_bucket_arn}/*"
      }
    ]
  })
}

# Attach policy to Zombie role

resource "aws_iam_role_policy_attachment" "zombie_manage" {
  role       = aws_iam_role.zombie.name
  policy_arn = aws_iam_policy.zombie_manage.arn
}

