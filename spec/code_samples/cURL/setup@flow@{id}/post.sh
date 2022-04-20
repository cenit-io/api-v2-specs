#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/flow"
item_id="620364d55a5a236eda02cfb0"

read -r -d '' data <<- EOM
  {
      active: true,
    }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
