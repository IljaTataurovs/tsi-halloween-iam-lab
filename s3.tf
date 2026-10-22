
resource "aws_s3_bucket" "gallery" {
  bucket = var.bucket_name

  tags = {
    Name        = "Halloween Spooky Gallery"
    Environment = "StudentLab"
    Project     = "TSI-IAM-Lab"
  }
}

resource "aws_s3_bucket_public_access_block" "gallery" {
  bucket = aws_s3_bucket.gallery.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "gallery" {
  bucket = aws_s3_bucket.gallery.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "gallery" {
  bucket = aws_s3_bucket.gallery.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
