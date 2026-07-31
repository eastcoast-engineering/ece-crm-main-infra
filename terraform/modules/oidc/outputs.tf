output "role_arn" {
  description = "ARN of the GitHub OIDC deployment role."
  value       = aws_iam_role.github_oidc_role.arn
}

output "role_name" {
  description = "Name of the GitHub OIDC deployment role."
  value       = aws_iam_role.github_oidc_role.name
}

output "policy_arn" {
  description = "ARN of the GitHub deployment policy."
  value       = aws_iam_policy.github_oidc_policy.arn
}

output "policy_name" {
  description = "Name of the GitHub deployment policy."
  value       = aws_iam_policy.github_oidc_policy.name
}

output "github_subject" {
  description = "GitHub OIDC subject trusted by the IAM role."
  value       = local.github_subject
}