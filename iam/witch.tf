
# Witch IAM Role - Upload and delete S3 objects

resource "aws_iam_role" "witch" {
  name = "tsi-halloween-witch-role"

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
    Role    = "Witch"
  }
}

# Customer-managed IAM policy

resource "aws_iam_policy" "witch_write" {
  name        = "tsi-halloween-witch-write"
  description = "Upload and delete objects in Halloween gallery"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "UploadDeleteGalleryObjects"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${local.gallery_bucket_arn}/*"
      }
    ]
  })
}

# Attach policy to Witch role

resource "aws_iam_role_policy_attachment" "witch_write" {
  role       = aws_iam_role.witch.name
  policy_arn = aws_iam_policy.witch_write.arn
}

