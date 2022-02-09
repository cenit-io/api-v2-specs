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

const item_id = '6203c5dd5a5a233de3027b96'

let request = axios({
  method: 'POST',
  url: `setup/ruby_converter/${item_id}`,
  httpsAgent: agent,
  data: {
    source_handler: true,
    code: 'sources.each {|s| target_data_type.create_from_json!(name: s.name.downcase, primary_field: %i[name]) }',
  }
});

request.then((response) => {
  // Do something with the response
  console.log(JSON.stringify(response.data, null, 2));
}).catch((error) => {
  // Do something with the error
  console.error(JSON.stringify(error.response.data, null, 2));
});