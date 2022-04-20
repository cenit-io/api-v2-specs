#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_parser"

read -r -d '' data <<- EOM
  {
      "namespace": "Test",
      "name": "parser_test_01",
      "target_data_type": {
        "_reference": true,
        "namespace": "Test",
        "name": "Person"
      },
      "code": "{ name: data[:name].downcase }"
  }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
