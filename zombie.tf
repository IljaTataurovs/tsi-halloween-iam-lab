
# Zombie Role - Manage gallery objects and tags

resource "aws_iam_role" "zombie" {
  name = "tsi-halloween-zombie-role"

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
    Role    = "Zombie"
  }
}

resource "aws_iam_role_policy" "zombie_manage" {
  name = "tsi-halloween-zombie-manage"
  role = aws_iam_role.zombie.id

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

        Resource = "${aws_s3_bucket.gallery.arn}/*"
      }
    ]
  })
}
