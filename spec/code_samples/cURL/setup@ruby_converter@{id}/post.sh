#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_converter"
item_id="6203c5dd5a5a233de3027b96"

read -r -d '' data <<- EOM
  {
       source_handler: true,
       code: 'sources.each {|s| target_data_type.create_from_json!(name: s.name.downcase, primary_field: %i[name]) }',
  }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
