# Prisma Cloud Mass Azure Subscription Onboarding

## Credentials for Prisma Cloud

The provider config file expect a `.prismacloud_auth.json` file.

An example config structure can look like:
```
{
    "url": "api.eu.prismacloud.io", 
    "username": "yada_access_key", 
    "password": "yada_secret_key", 
    "protocol": "https"
}
```

## Create the azure.csv 


```
cp azure_example.csv azure.csv
```

Fill the `azure.csv` with the different Azure Subscriptions and the Enterprise Application informations.  

This is the format you should follow:  

```csv
accountId,name,clientId,key,tenantId,servicePrincipalId 
<subscription_id>,<subscription_name>,<application_id>,<applicaion_secret>,<tenant_id>,<applicaion_object_id>
```

## Execute the terraform script

```
terraform apply
terraform plan
terraform apply
```