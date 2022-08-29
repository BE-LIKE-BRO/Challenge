resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled             = var.enabled
  default_root_object = var.default_root_object
  retain_on_delete    = var.retain_on_delete
  aliases             = var.domain_names
  price_class         = var.price_class
  is_ipv6_enabled     = var.is_ipv6_enabled

  origin {
    domain_name = aws_s3_bucket.blb-main-bucket.website_endpoint
    origin_id   = aws_s3_bucket.blb-main-bucket.website_endpoint

    custom_origin_config {
      http_port                = var.http_port
      https_port               = var.https_port
      origin_keepalive_timeout = var.origin_keepalive_timeout
      origin_protocol_policy   = var.origin_protocol_policy
      origin_ssl_protocols     = var.origin_ssl_protocols
      origin_read_timeout      = var.origin_read_timeout
    }

  }


  logging_config {
    include_cookies = var.include_cookies
    bucket          = aws_s3_bucket.blb-log-bucket.bucket_domain_name
    prefix          = ""
  }

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = aws_s3_bucket_website_configuration.web_config.website_endpoint
    compress         = var.compress

    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    cloudfront_default_certificate = var.cloudfront_default_certificate
    minimum_protocol_version       = var.minimum_protocol_version
    ssl_support_method             = var.ssl_support_method
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
    }
  }
}