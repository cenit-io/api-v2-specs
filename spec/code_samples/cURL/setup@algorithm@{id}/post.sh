#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/algorithm"
item_id="61eeeea05a5a2353a401b2c6"

read -r -d '' data <<- EOM
  {
      code: `return 1 + ${Date.now()}`,
   }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
