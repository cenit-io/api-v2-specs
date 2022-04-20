#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/basic_authorization"
item_id="62069b095a5a2330d0038cdc"

curl -G "${base_url}/${path}/${item_id}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"\
  -d ignore=password
