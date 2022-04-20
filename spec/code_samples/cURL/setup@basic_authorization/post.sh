#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/basic_authorization"

read -r -d '' data <<- EOM
  {
      namespace: "Test2",
      name: "auth_basic",
      username: "test2_auth_basic",
      password: "test2_auth_basic"
    }
EOM

curl "${base_url}/${path}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
