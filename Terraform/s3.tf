#########################################
######### WEBSITE HOST BUCKET ###########
#########################################

#S3 Bucket
resource "aws_s3_bucket" "blb-main-bucket" {
  bucket        = var.host_bucket_name
  force_destroy = var.force_destroy
}


#S3 Bucket Policy
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.blb-main-bucket.bucket
  policy = data.aws_iam_policy_document.main_buck_policy.json
}

data "aws_iam_policy_document" "main_buck_policy" {
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${var.host_bucket_name}/*"]
    actions   = ["s3:GetObject"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}


#Bucket ACL
resource "aws_s3_bucket_acl" "main_bucket_acl" {
  bucket = aws_s3_bucket.blb-main-bucket.bucket
  acl    = "public-read"
}

#Bucket Website Config
resource "aws_s3_bucket_website_configuration" "web_config" {
  bucket = aws_s3_bucket.blb-main-bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}




#########################################
######## CLOUDFRONT LOGS BUCKET #########
#########################################

#S3 Bucket
resource "aws_s3_bucket" "blb-log-bucket" {
  bucket        = var.log_bucket_name
  force_destroy = var.force_destroy
}

#Bucket ACL
resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.blb-log-bucket.bucket
  acl    = "private"
}
