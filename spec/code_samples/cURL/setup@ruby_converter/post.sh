#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_converter"

read -r -d '' data <<- EOM
  {
      namespace: "Test",
      name: "converter_test_01",
      source_handler: false,
      source_data_type: {
        _reference: true,
        namespace: "Test",
        name: "Person"
      },
      target_data_type: {
        _reference: true,
        namespace: "Test",
        name: "Person2"
      },
      code: 'target.name = source.name.downcase',
    }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
