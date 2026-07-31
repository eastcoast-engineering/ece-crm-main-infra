data "aws_iam_policy_document" "ecs_task_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_execution" {
  name               = substr("${local.name_prefix}-ecs-execution", 0, 64)
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "ecs_execution" {
  role       = aws_iam_role.ecs_execution.name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "database_secret" {
  statement {
    sid     = "ReadDatabasePassword"
    effect  = "Allow"
    actions = ["secretsmanager:GetSecretValue"]
    resources = [var.database_secret_arn]
  }
}

resource "aws_iam_role_policy" "database_secret" {
  name   = "${local.name_prefix}-database-secret"
  role   = aws_iam_role.ecs_execution.id
  policy = data.aws_iam_policy_document.database_secret.json
}

resource "aws_iam_role" "ecs_task" {
  name               = substr("${local.name_prefix}-ecs-task", 0, 64)
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json

  tags = local.common_tags
}