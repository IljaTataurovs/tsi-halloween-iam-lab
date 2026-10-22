
# Witch Role - Upload and delete Halloween gallery objects

resource "aws_iam_role" "witch" {
  name = "tsi-halloween-witch-role"

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
    Role    = "Witch"
  }
}

resource "aws_iam_role_policy" "witch_write" {
  name = "tsi-halloween-witch-write"
  role = aws_iam_role.witch.id

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

        Resource = "${aws_s3_bucket.gallery.arn}/*"
      }
    ]
  })
}
