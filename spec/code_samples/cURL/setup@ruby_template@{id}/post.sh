#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_template"
item_id="61f1597a5a5a2353be026f14"

read -r -d '' data <<- EOM
  {
      mime_type: 'application/json',
      file_extension: 'json',
      bulk_source: true,
      code: 'sources.to_json',
  }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
