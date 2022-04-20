#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/algorithm"
item_id="61eeeea05a5a2353a401b2c6"

curl "${base_url}/${path}/${item_id}" \
  -X "DELETE" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"
