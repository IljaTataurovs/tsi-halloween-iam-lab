
# Ghost Role - Read-only access to Halloween S3

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "ghost" {
  name = "tsi-halloween-ghost-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      }
    ]
  })

  tags = {
    Project = "TSI-Halloween-IAM-Lab"
    Role    = "Ghost"
  }
}

resource "aws_iam_role_policy" "ghost_read" {
  name = "tsi-halloween-ghost-read"
  role = aws_iam_role.ghost.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "ListGallery"
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = aws_s3_bucket.gallery.arn
      },
      {
        Sid    = "ReadGalleryObjects"
        Effect = "Allow"
        Action = [
          "s3:GetObject"
        ]
        Resource = "${aws_s3_bucket.gallery.arn}/*"
      }
    ]
  })
}
