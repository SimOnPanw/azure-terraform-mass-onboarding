# Prisma Cloud Mass Azure Subscription Onboarding

This Terraform script automates the onboarding of multiple Azure subscriptions to Prisma Cloud. Follow the steps below to configure your credentials and execute the script.

## Prerequisites

- **Terraform** installed on your machine. ([Download Terraform](https://www.terraform.io/downloads.html))
- **Prisma Cloud Access Key** and **Secret Key**.
- **Azure Subscriptions** and an **Enterprise Application** set up in Azure Active Directory.

## Table of Contents

- [Setup](#setup)
  - [1. Configure Prisma Cloud Credentials](#1-configure-prisma-cloud-credentials)
  - [2. Prepare the Azure Subscriptions CSV File](#2-prepare-the-azure-subscriptions-csv-file)
- [Execution](#execution)
  - [1. Initialize Terraform](#1-initialize-terraform)
  - [2. Review the Terraform Plan](#2-review-the-terraform-plan)
  - [3. Apply the Terraform Configuration](#3-apply-the-terraform-configuration)

## Setup

### Configure Prisma Cloud Credentials

Create a `.prismacloud_auth.json` file in the root directory of the Terraform project with the following content:

```json
{
    "url": "api.eu.prismacloud.io",
    "username": "<access_key>",
    "password": "<secret_key>",
    "protocol": "https"
}
```

- Replace <access_key> with your Prisma Cloud access key.
- Replace <secret_key> with your Prisma Cloud secret key.
- Ensure the url matches your Prisma Cloud API endpoint (e.g., api.eu.prismacloud.io for the European region).

Note: Keep this file secure as it contains sensitive information.

### Prepare the Azure Subscriptions CSV File
Copy the example CSV file and rename it:

```bash
cp azure_example.csv azure.csv
```

Edit `azure.csv` and fill in the details for each Azure subscription and Enterprise Application. The CSV should follow this format:

```csv
accountId,name,clientId,key,tenantId,servicePrincipalId
<subscription_id>,<subscription_name>,<application_id>,<application_secret>,<tenant_id>,<application_object_id>
```

- **accountId**: Azure Subscription ID.
- **name**: Name of the Azure Subscription.
- **clientId**: Application (client) ID of the Enterprise Application.
- **key**: Client secret of the Enterprise Application.
- **tenantId**: Azure Active Directory Tenant ID.
- **servicePrincipalId**: Object ID of the Enterprise Application.

Important: Ensure there are no extra spaces or line breaks in the CSV file.

## Execution
### 1. Initialize Terraform

Initialize the Terraform working directory:

```bash
terraform init
```

### 2. Review the Terraform Plan
Review the actions Terraform will perform:

```bash
terraform plan
```

### 3. Apply the Terraform Configuration

Apply the Terraform configuration to onboard the Azure subscriptions:

```bash
terraform apply
```
Type `yes` when prompted to confirm the operation.