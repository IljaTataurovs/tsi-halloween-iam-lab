\## IAM Policy Implementation



The project uses three customer-managed IAM policies:



\- \*\*Ghost:\*\* `tsi-halloween-ghost-read` — allows listing the gallery bucket and reading objects.

\- \*\*Witch:\*\* `tsi-halloween-witch-write` — allows uploading and deleting objects.

\- \*\*Zombie:\*\* `tsi-halloween-zombie-manage` — allows listing, reading, uploading, deleting, and managing object tags.



Each policy is attached to a separate IAM role using Terraform's `aws\_iam\_role\_policy\_attachment` resource.



All three roles use a trust policy restricted to the designated AWS IAM role, following the principle of least privilege.



\## Validation and Deployment Status



Terraform initialization and validation completed successfully.



The final Terraform plan reports:



`Plan: 13 to add, 0 to change, 0 to destroy.`



The Terraform configuration has been uploaded to GitHub.



AWS infrastructure deployment remains pending because an AWS Organizations Service Control Policy explicitly denies `s3:CreateBucket` in the current account.



Consequently, live IAM role permission testing has not yet been performed.



\## Cleanup



After successful deployment and testing, remove the infrastructure using:



`terraform destroy`



Review the destruction plan before confirming. Versioned S3 objects must be removed before Terraform can delete a nonempty versioned bucket with the current configuration.

