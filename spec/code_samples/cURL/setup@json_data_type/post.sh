#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/json_data_type"

read -r -d '' data <<- EOM
  {
      "namespace": "Test",
      "name": "Person45",
      "code": "{\"type\":\"object\",\"properties\":{\"dni\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"}}}"
  }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
