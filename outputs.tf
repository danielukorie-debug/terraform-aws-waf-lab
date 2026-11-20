output "web_acl_id" {
  description = "WAF Web ACL ID after deployment."
  value       = aws_wafv2_web_acl.lab.id
}

output "web_acl_arn" {
  description = "WAF Web ACL ARN after deployment."
  value       = aws_wafv2_web_acl.lab.arn
}

output "web_acl_name" {
  description = "Planned WAF Web ACL name."
  value       = aws_wafv2_web_acl.lab.name
}
