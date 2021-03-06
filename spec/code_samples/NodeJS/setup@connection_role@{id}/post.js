const dotenv = require('dotenv')
const axios = require('axios');

dotenv.config();

axios.defaults.baseURL = process.env['BASE_URL'] || 'https://cenit.io/api/v2/';
axios.defaults.headers.common['Content-Type'] = 'application/json'
axios.defaults.headers.common['X-Tenant-Access-Key'] = process.env['X_TENANT_ACCESS_KEY']
axios.defaults.headers.common['X-Tenant-Access-Token'] = process.env['X_TENANT_ACCESS_TOKEN']

const item_id = '620951d95a5a233eb9043557'

let request = axios({
  method: 'POST',
  url: `setup/connection_role/${item_id}`,
  headers: {
    'X-Parser-Options': JSON.stringify({
      primary_fields: ['namespace','name'],
      reset: ['webhooks'],
      add_only: true
    })
  },
  data: {
    webhooks: [
      {
        _reference: true,
        namespace: "Test",
        name: "webhook_test_02"
      }
    ],
    connections: [
      {
        _reference: true,
        namespace: "Test",
        name: "connection_test_02"
      }
    ],
  }
});

request.then((response) => {
  // Do something with the response
  console.log(JSON.stringify(response.data, null, 2));
}).catch((error) => {
  // Do something with the error
  console.error(JSON.stringify(error.response.data, null, 2));
});