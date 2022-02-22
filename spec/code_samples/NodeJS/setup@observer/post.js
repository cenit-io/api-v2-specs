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
  url: 'setup/observer',
  httpsAgent: agent,
  data: {
    namespace: "Test",
    name: "observer_test_01",
    data_type: {
      _reference: true,
      namespace: "Test",
      name: "Person"
    },
    triggers: {created_at:[{o: "_not_null",v:["","",""]}]},
  }
});

request.then((response) => {
  // Do something with the response
  console.log(JSON.stringify(response.data, null, 2));
}).catch((error) => {
  // Do something with the error
  console.error(JSON.stringify(error.response.data, null, 2));
});

