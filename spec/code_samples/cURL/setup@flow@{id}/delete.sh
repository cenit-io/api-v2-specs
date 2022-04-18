#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/flow"
item_id="61e083815a5a2353c40082f3"

curl "${base_url}/${path}/${item_id}" \
  -X "DELETE" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"
