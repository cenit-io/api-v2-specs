#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/connection"
item_id="62070ef05a5a23307d038a63"

curl -G "${base_url}/${path}/${item_id}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"\
  -d embedding=authorization \
  -d ignore=password
