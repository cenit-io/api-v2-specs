#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_parser"
item_id="61eeeb7f5a5a234adc00ab2b"

curl "${base_url}/${path}/${item_id}" \
  -X "DELETE" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"
