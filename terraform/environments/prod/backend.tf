terraform {
  backend "s3" {
    bucket       = "ece-prod-terraform-state-905611588718"
    key          = "infrastructure/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}