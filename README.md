# smart-erp-infra

Terraform infrastructure project for Smart ERP deployment on AWS.

## Overview

This project provisions a cost-optimized deployment footprint:
- Backend: ECS Fargate service (single service, low CPU/memory)
- Container registry: ECR repository for backend images
- Frontend: S3 static hosting (optional CloudFront)
- Logging: CloudWatch log group for backend tasks

## Structure

```text
smart-erp-infra/
  modules/
    dev_stack/
      main.tf
      variables.tf
      outputs.tf
  environments/
    dev/
      versions.tf
      providers.tf
      variables.tf
      main.tf
      terraform.tfvars.example
    production/
      versions.tf
      providers.tf
      variables.tf
      main.tf
      terraform.tfvars.example
```

## Environment Strategy

- `dev`: active deployment target
- `production`: defined but defaulted to `desired_count = 0` until explicitly activated

## Required GitHub Secrets and Variables

### Shared AWS credentials (Secrets)
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### Shared AWS settings (Variables or Secrets)
- `AWS_REGION`

### Frontend deploy variables
- `FRONTEND_DEV_BUCKET_NAME`

### Backend deploy variables
- `ECR_REPOSITORY`
- `ECS_CLUSTER`
- `ECS_SERVICE`
- `ECS_TASK_DEFINITION`
- `ECS_CONTAINER_NAME`

## Local Terraform Usage

From `environments/dev`:

```bash
terraform init
cp terraform.tfvars.example terraform.tfvars
terraform plan
terraform apply
```

From `environments/production`:

```bash
terraform init
cp terraform.tfvars.example terraform.tfvars
terraform plan
# apply only when production cutover is approved
```

## CI/CD Flow

### Frontend pipeline (`frontend/.github/workflows/deploy-dev.yml`)
1. Build Angular app
2. Sync build artifacts to S3 dev bucket

### Backend pipeline (`backend/.github/workflows/deploy-dev.yml`)
1. Build Docker image
2. Push image to ECR
3. Render ECS task definition with the new image
4. Deploy updated task definition to ECS service

## Notes

- The module currently uses default VPC/subnets for lowest setup overhead.
- Consider custom VPC, ALB, private networking, and WAF before production hardening.


### Data Contract Rule: No Parser-Only Functions

- Do not create functions whose only purpose is renaming, reshaping, or field-to-field mapping (for example `parseX`, `mapX`, `toX`, `fromX`, `convertX`, adapter-only helpers).
- Prefer one intentional contract reused end-to-end: frontend form shape, frontend service payload, API request/response DTOs, backend structs, and persistence-facing models should align by design.
- When frontend and backend shapes diverge, fix the source contract first instead of adding a mapping layer.
- Treat parser-only conversion code as a code smell and avoid duplicate DTOs that represent the same flow without business value.

Allowed exceptions (must be intentional and documented):
- Third-party/external API normalization into internal models.
- Database-specific type conversion into API-safe responses.
- Legacy migration/backfill compatibility.
- Meaningful validation/normalization that changes semantics (not simple renaming).
- Sensitive-field protection before returning data to clients.
- Reporting/export/chart/UI-only projection models.

Before adding any conversion helper:
- Check whether the same shared contract can be used across frontend and backend.
- Prefer updating DTO/interface/struct definitions over adding mapping glue.
- If conversion is still required, document the reason with a short comment near the implementation.
