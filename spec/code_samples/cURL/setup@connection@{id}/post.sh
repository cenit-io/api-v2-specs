#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/connection"
item_id="62070ef05a5a23307d038a63"

read -r -d '' data <<- EOM
  {
      "url": "{{domain}}/api/v2/connection_test",
      "template_parameters":[
        {
          "key": "domain"
        }
      ]
  }
EOM

curl "${base_url}/${path}/${item_id}" \
  -X "POST" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${data}"
