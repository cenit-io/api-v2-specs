#!/bin/bash

base_url=${BASE_URL:="https://cenit.io/api/v2"}
path="setup/ruby_template"

curl -G "${base_url}/${path}" \
  -H "X-Tenant-Access-Key: ${X_TENANT_ACCESS_KEY}" \
  -H "X-Tenant-Access-Token: ${X_TENANT_ACCESS_TOKEN}" \
  -d limit=5 \
  -d page=1 \
  -d order=-namespace,name \
  -d embedding=snippet