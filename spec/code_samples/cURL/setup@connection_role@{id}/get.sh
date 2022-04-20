#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/connection_role"
item_id="620951d95a5a233eb9043557"

curl -G "${base_url}/${path}/${item_id}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"\
  -d embedding=authorization \
  -d ignore=password
