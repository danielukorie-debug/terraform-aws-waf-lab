resource "aws_wafv2_web_acl" "lab" {
  name        = "terraform-waf-lab"
  description = "Learning lab for AWS WAF rate-based protection"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "rate-limit-rule"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit                 = 100
        aggregate_key_type    = "IP"
        evaluation_window_sec = 300
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "terraform-waf-rate-limit"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "terraform-waf-lab"
    sampled_requests_enabled   = true
  }

  tags = {
    Project     = "terraform-aws-waf-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}
