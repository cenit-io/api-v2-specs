const dotenv = require('dotenv')
const axios = require('axios');

dotenv.config();

axios.defaults.baseURL = process.env['BASE_URL'] || 'https://cenit.io/api/v2/';
axios.defaults.headers.common['Content-Type'] = 'application/json'
axios.defaults.headers.common['X-Tenant-Access-Key'] = process.env['X_TENANT_ACCESS_KEY']
axios.defaults.headers.common['X-Tenant-Access-Token'] = process.env['X_TENANT_ACCESS_TOKEN']

const item_id = '6205b5995a5a233dd9039b8a'
const param_id = '6205b5995a5a233dd9039b8b'

let request = axios({
  method: 'POST',
  url: `setup/plain_webhook/${item_id}`,
  data: {
    parameters: [
      {
        id: `${param_id}`,
        key: "limit",
        value: "100",
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