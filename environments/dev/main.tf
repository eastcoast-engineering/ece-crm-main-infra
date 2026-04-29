module "dev_stack" {
  source = "../../modules/dev_stack"

  project_name         = var.project_name
  environment          = var.environment
  aws_region           = var.aws_region
  backend_image        = var.backend_image
  frontend_bucket_name = var.frontend_bucket_name
  enable_cloudfront    = var.enable_cloudfront

  desired_count = 1
  task_cpu      = 256
  task_memory   = 512
}
