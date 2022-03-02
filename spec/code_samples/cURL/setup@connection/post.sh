#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/connection"

read -r -d '' data <<- EOM
  {
      "namespace": "Test",
      "name": "connection_test_01",
      "url": "http://localhost/api/v2/connection_test",
      "authorization": {
        "_reference": true,
        "namespace": "Test",
        "name": "auth_basic"
      },
      "headers":[
        {
          "key": "Content-Type",
          "value": "text/xml"
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
