#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/algorithm"
item_id="59d7dc1c25d985137f00843f"

curl -G "${base_url}/${path}/${item_id}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"\
  -d embedding=snippet