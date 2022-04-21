#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/connection_role"

read -r -d '' data <<- EOM
  {
      "namespace": "Test",
      "name": "connection_role_test_01",
      "webhooks": [
        {
          "_reference": true,
          "namespace": "Test",
          "name": "webhook_test_01"
        }
      ],
      "connections": [
        {
          "_reference": true,
          "namespace": "Test",
          "name": "connection_test_01"
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
