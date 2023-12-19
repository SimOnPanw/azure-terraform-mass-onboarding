# Prisma Cloud POV

The provider config file is/can be expected at the `.prismacloud_auth.json` file.

An example config structure can look like:
```
{
    "url": "api.eu.prismacloud.io", 
    "username": "yada_access_key", 
    "password": "yada_secret_key", 
    "protocol": "https"
}
```


Unless if you want to put the provider configs in a config file, then export your env var, similar to:

```
export PRISMACLOUD_USERNAME=yada_access_key
export PRISMACLOUD_PASSWORD=yada_secret_key
export PRISMACLOUD_URL=api.eu.prismacloud.io
export PRISMACLOUD_PROTOCOL=https
```

Full details at:
https://registry.terraform.io/providers/PaloAltoNetworks/prismacloud/latest/docs

