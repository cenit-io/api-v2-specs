#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/json_data_type"
item_id="61e0312b5a5a2353ad004469"

curl "${base_url}/${path}/${item_id}" \
  -X "DELETE" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"
