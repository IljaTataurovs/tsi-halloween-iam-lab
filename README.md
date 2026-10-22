\# TSI Halloween Spooky Gallery — Terraform IAM Lab



\*\*Course:\*\* Cloud Infrastructure and Service Management  

\*\*Lecturer:\*\* Dr. Aleksejs Vesjolijs  

\*\*Student:\*\* Ilja Tataurovs



\## 1. Project Overview



This project demonstrates Infrastructure as Code (IaC) using Terraform and AWS Identity and Access Management (IAM).



The objective is to configure a secure Halloween-themed S3 gallery with three IAM roles following the principle of least privilege.



\## 2. AWS Infrastructure



The Terraform configuration defines:



\- A private Amazon S3 bucket for the Halloween gallery

\- S3 versioning and AES256 server-side encryption

\- S3 Block Public Access settings

\- Three IAM roles with separate trust and permission policies



\## 3. IAM Roles and Permissions



| Permission | Ghost | Witch | Zombie |

|---|---|---|---|

| List bucket | Yes | No | Yes |

| Download objects | Yes | No | Yes |

| Upload objects | No | Yes | Yes |

| Delete objects | No | Yes | Yes |

| Manage object tags | No | No | Yes |

| Manage bucket policies | No | No | No |



\*\*Ghost:\*\* Read-only access to the gallery.



\*\*Witch:\*\* Uploads and deletes gallery objects without bucket administration permissions.



\*\*Zombie:\*\* Manages gallery objects and object tags without full S3 administration permissions.



Each role has an IAM trust policy defining who may assume it and a permissions policy defining its permitted actions. The current trust policies use the AWS account principal as a teaching example and should be restricted to an approved identity before deployment.





