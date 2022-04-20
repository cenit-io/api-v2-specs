#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_template"

read -r -d '' data <<- EOM
  {
      namespace: "Test",
      name: "template_test_01",
      mime_type: 'application/json',
      file_extension: 'json',
      bulk_source: false,
      source_data_type: {
        _reference: true,
        namespace: "Test",
        name: "Person"
      },
      code: 'source.to_json',
    }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
