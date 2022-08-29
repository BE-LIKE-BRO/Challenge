variable "host_bucket_name" {
  default = "blb-main-bucket"
}

variable "log_bucket_name" {
  default = "blb-log-bucket"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "domain_names" {
  default = ["firstpractice.online"]
}

variable "domain_name" {
  default = "firstpractice.online"
}

variable "validation_method" {
  default = "DNS"
}

variable "domain_aliases" {
  default = "*.firstpractice.online"
}

variable "default_root_object" {
  default = "index.html"
}

variable "price_class" {
  default = "PriceClass_All"
}

variable "acm_certificate_arn" {
  default = "arn:aws:acm:us-east-1:237301564654:certificate/55586173-7936-4a19-8b84-309c54a393a7"
}

variable "minimum_protocol_version" {
  default = "TLSv1.2_2021"
}

variable "ssl_support_method" {
  default = "sni-only"
}

variable "enabled" {
  type    = bool
  default = true
}

variable "is_ipv6_enabled" {
  type    = bool
  default = true
}

variable "retain_on_delete" {
  type    = bool
  default = false
}

variable "allowed_methods" {
  default = ["GET", "HEAD"]
}

variable "cached_methods" {
  default = ["GET", "HEAD"]
}

variable "viewer_protocol_policy" {
  default = "redirect-to-https"
}

variable "min_ttl" {
  default = 0
}

variable "default_ttl" {
  default = 0
}

variable "max_ttl" {
  default = 0
}

variable "include_cookies" {
  type    = bool
  default = false
}

variable "cloudfront_default_certificate" {
  type    = bool
  default = false
}

variable "restriction_type" {
  default = "none"
}

variable "compress" {
  type    = bool
  default = true
}

########

variable "http_port" {
  default = "80"
}

variable "https_port" {
  default = "443"
}

variable "origin_keepalive_timeout" {
  default = 5
}

variable "origin_protocol_policy" {
  default = "http-only"
}

variable "origin_ssl_protocols" {
  default = ["TLSv1", "TLSv1.1", "TLSv1.2"]
}

variable "origin_read_timeout" {
  default = 30
}


variable "server_side_encryption" {
  type    = bool
  default = false
}

variable "policies" {
  default = [
    "arn:aws:iam::237301564654:policy/lambda_dynamodb_policy",
    "arn:aws:iam::237301564654:policy/lambda_basic_exec_policy",
    "arn:aws:iam::237301564654:policy/Dynamodb_stream_policy",
    "arn:aws:iam::237301564654:policy/lambda_sns_policy"
  ]
}

variable "emails" {
  default = [
    "ayoolacoul27@gmail.com",
    "dunknny@yahoo.com"
  ]
}


