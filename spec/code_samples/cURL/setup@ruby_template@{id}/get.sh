#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_template"
item_id="61f1597a5a5a2353be026f14"

curl -G "${base_url}/${path}/${item_id}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}"\
  -d embedding=authorization \
  -d ignore=password
