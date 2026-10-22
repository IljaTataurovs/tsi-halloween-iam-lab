
# Ghost IAM Role - Read-only S3 access

resource "aws_iam_role" "ghost" {
  name = "tsi-halloween-ghost-role"

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
    Role    = "Ghost"
  }
}

# Customer-managed policy for Ghost

resource "aws_iam_policy" "ghost_read" {
  name        = "tsi-halloween-ghost-read"
  description = "Read-only access to Halloween gallery"

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
        Sid      = "ReadGalleryObjects"
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "${local.gallery_bucket_arn}/*"
      }
    ]
  })
}

# Attach customer-managed policy to Ghost role

resource "aws_iam_role_policy_attachment" "ghost_read" {
  role       = aws_iam_role.ghost.name
  policy_arn = aws_iam_policy.ghost_read.arn
}

