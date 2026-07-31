environment = "dev"
root_domain = "quotashark.com"
sub_domain = "dev"

front_website_github_repo = "eastcoast-engineering/eastcoast-engineering-CRM-frontend"
front_website_github_branch = "dev"

backend_github_repo   = "eastcoast-engineering/corporate-software-backend-template"
backend_github_branch = "dev"

api_public = true
backend_vpc_cidr = "10.50.0.0/16"
api_public_cidrs  = ["0.0.0.0/0"]
api_private_cidrs = []

backend_container_port        = 8080
backend_health_check_path     = "/health"
backend_task_cpu              = 512
backend_task_memory           = 1024
backend_initial_desired_count = 0

backend_container_environment = {
  RUST_LOG = "debug"
}

database_public = false

# When database_public is true, use a precise address such as ["203.0.113.10/32"].
database_public_cidrs = []

database_name                  = "quotashark"
database_username              = "quotashark_admin"
database_engine_version        = "16"
database_instance_class        = "db.t4g.micro"
database_allocated_storage     = 20
database_max_allocated_storage = 50
database_backup_retention_days = 1
database_multi_az              = false
database_deletion_protection   = false
database_skip_final_snapshot   = true
database_apply_immediately     = true