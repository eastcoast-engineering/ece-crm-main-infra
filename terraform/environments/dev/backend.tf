terraform {
  backend "s3" {
    bucket       = "ece-dev-terraform-state-964308144304"
    key          = "infrastructure/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}