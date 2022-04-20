#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/algorithm"

read -r -d '' data <<- EOM
  {
      namespace: "Test",
      name: "alg_test_01",
      type: "ruby",
      code: "return 1 + 1",
    }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
