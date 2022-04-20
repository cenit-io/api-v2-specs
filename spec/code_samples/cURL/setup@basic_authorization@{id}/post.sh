#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/basic_authorization"
item_id="62069b095a5a2330d0038cdc"

read -r -d '' data <<- EOM
  {
      username: "test_auth_basic@api_v2"
    }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
