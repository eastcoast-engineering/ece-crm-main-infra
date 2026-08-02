resource "aws_ecr_repository" "api" {
  name                 = "${local.name_prefix}-api"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
  force_delete         = var.ecr_force_delete

  image_tag_mutability_exclusion_filter {
    filter_type = "WILDCARD"
    filter      = "buildcache"
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = local.common_tags
}

resource "aws_ecr_lifecycle_policy" "api" {
  repository = aws_ecr_repository.api.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Retain the latest 30 backend images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 30
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}