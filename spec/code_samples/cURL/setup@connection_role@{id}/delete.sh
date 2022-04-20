#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/connection_role"
item_id="620951d95a5a233eb9043557"

curl "${base_url}/${path}/${item_id}" \
  -X "DELETE" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"
