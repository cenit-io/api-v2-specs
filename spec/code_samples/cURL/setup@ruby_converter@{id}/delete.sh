#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_converter"
item_id="6203c5dd5a5a233de3027b96"

curl "${base_url}/${path}/${item_id}" \
  -X "DELETE" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"
