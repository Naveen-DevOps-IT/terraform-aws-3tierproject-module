# Create an S3 Bucket
resource "aws_s3_bucket" "new_bucket" {
  bucket = "naveenk-bucket-terraform"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.new_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}