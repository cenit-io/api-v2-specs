#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/plain_webhook"

read -r -d '' data <<- EOM
  {
      "namespace": "Test",
      "name": "webhook_test_01",
      "method": "get",
      "path": "api/v2/test_01",
      "parameters": [
        {
          "key": "limit",
          "value": "50"
        }
      ]
  }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
