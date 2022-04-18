#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/plain_webhook"
item_id="6205b5995a5a233dd9039b8a"

curl -G "${base_url}/${path}/${item_id}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"\
  -d embedding=authorization \
  -d ignore=password
