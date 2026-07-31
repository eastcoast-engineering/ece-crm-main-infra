locals {
  project_slug = trim(
    replace(lower(var.project_name), "/[^a-z0-9_-]/", "-"),
    "-"
  )

  environment_slug = trim(
    replace(lower(var.environment), "/[^a-z0-9_-]/", "-"),
    "-"
  )

  branch_slug = trim(
    replace(lower(var.branch), "/[^a-z0-9_-]/", "-"),
    "-"
  )

  # IAM role names are limited to 64 characters.
  role_name = substr(
    "${local.project_slug}-${local.environment_slug}-${local.branch_slug}-github-deploy",
    0,
    64
  )

  policy_name = substr(
    "${local.project_slug}-${local.environment_slug}-${local.branch_slug}-github-deploy-policy",
    0,
    128
  )
}

# Reuse the GitHub OIDC provider that already exists in this AWS account.
data "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
}

data "aws_iam_policy_document" "github_oidc_assume_role" {
  statement {
    sid     = "AllowGitHubActions"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"

      identifiers = [
        data.aws_iam_openid_connect_provider.github.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:${var.github_repo}:ref:refs/heads/${var.branch}"
      ]
    }
  }
}

resource "aws_iam_role" "github_oidc_role" {
  name = local.role_name

  assume_role_policy = data.aws_iam_policy_document.github_oidc_assume_role.json

  description = "GitHub deployment role for ${var.github_repo}:${var.branch}"

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

data "aws_iam_policy_document" "github_deployment" {
  statement {
    sid    = "ListFrontendBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]

    resources = [
      var.frontend_bucket_arn
    ]
  }

  statement {
    sid    = "ManageFrontendObjects"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      "${var.frontend_bucket_arn}/*"
    ]
  }

  statement {
    sid    = "ManageCloudFrontInvalidations"
    effect = "Allow"

    actions = [
      "cloudfront:CreateInvalidation",
      "cloudfront:GetInvalidation",
      "cloudfront:ListInvalidations",
      "cloudfront:GetDistribution",
      "cloudfront:GetDistributionConfig",
    ]

    resources = [
      var.cloudfront_distribution_arn
    ]
  }
}

resource "aws_iam_policy" "github_oidc_policy" {
  name        = local.policy_name
  description = "Deployment policy for ${var.github_repo}:${var.branch}"
  policy      = data.aws_iam_policy_document.github_deployment.json

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "github_oidc_attach" {
  role       = aws_iam_role.github_oidc_role.name
  policy_arn = aws_iam_policy.github_oidc_policy.arn
}