#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_parser"
item_id="61eeeb7f5a5a234adc00ab2b"

read -r -d '' data <<- EOM
  {
      code: '{ name: data[:name].upcase }',
  }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
