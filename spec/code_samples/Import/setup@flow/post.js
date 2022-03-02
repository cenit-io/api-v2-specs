const dotenv = require('dotenv')
const axios = require('axios');
const https = require('https');

const agent = new https.Agent({
  rejectUnauthorized: false
});

dotenv.config();

axios.defaults.baseURL = process.env['BASE_URL'] || 'https://cenit.io/api/v2/';
axios.defaults.headers.common['Content-Type'] = 'application/json'
axios.defaults.headers.common['X-Tenant-Access-Key'] = process.env['X_TENANT_ACCESS_KEY']
axios.defaults.headers.common['X-Tenant-Access-Token'] = process.env['X_TENANT_ACCESS_TOKEN']

const request = axios({
  method: 'POST',
  url: 'setup/flow',
  httpsAgent: agent,
  headers: {
    'X-Parser-Options': JSON.stringify({
      primary_fields: ['namespace','name'],
      // reset: [],
     ignore: ['translator','webhook'],
      add_only: false
    })
  },
  data: {
    namespace: "Test",
    name: "flow_import_test_01",
    active: false,
    // notify_response: true,
    // translator: {
    //   _reference: true,
    //   namespace: 'Test',
    //   name: 'parser_test_01',
    // },
    // webhook: {
    //   _reference: true,
    //   namespace: 'Test',
    //   name: 'webhook_test_01',
    // },
    after_process_callbacks: [
      { _reference: true, namespace: 'Test', name: 'alg_test_01' },
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

