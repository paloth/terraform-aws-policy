output "policy_id" {
  value       = aws_iam_policy.this.id
  description = "Policy id"
}

output "policy_arn" {
  value       = aws_iam_policy.this.arn
  description = "Policy arn"
}

output "policy_name" {
  value       = aws_iam_policy.this.name
  description = "Policy name"
}
