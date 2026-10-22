## Deployment Results — 22 October 2026

The Halloween Spooky Gallery infrastructure was successfully
deployed to AWS using Terraform.

### AWS Environment

- AWS Region: eu-north-1 (Europe, Stockholm)
- S3 Bucket: tsi-halloween-gallery-ilja-2026
- Account: AWS project environment (Hold My Coffee)
- Total Terraform resources: 13

### Infrastructure

The deployment uses two separate Terraform configurations:

- `iam/` — 9 IAM resources:
  - Ghost: read-only access
  - Witch: upload and delete objects
  - Zombie: object and tag management
- `s3/` — 4 S3 resources:
  - Private S3 bucket
  - Block Public Access
  - Bucket Versioning
  - SSE-S3 encryption (AES-256)

### Verification

Verified in AWS Management Console:

- S3 bucket exists in Stockholm
- Bucket Versioning is enabled
- Default encryption uses SSE-S3
- Block All Public Access is enabled
- Three IAM roles and their policies are created and attached

Note: IAM policies were reviewed in the AWS Console.
Live role-assumption access tests have not been completed.

### Terraform Commands

Deploy S3 infrastructure:

    cd s3
    terraform init
    terraform plan
    terraform apply

Deploy IAM infrastructure:

    cd iam
    terraform init
    terraform plan
    terraform apply

### Cleanup

After completing the assignment, remove resources
using Terraform from each deployed working directory.

    terraform destroy

IMPORTANT: The existing AWS resources are managed by
separate local Terraform state files. Do not run
terraform apply or destroy from a fresh repository clone
without first importing the existing resources or
restoring the correct state files.