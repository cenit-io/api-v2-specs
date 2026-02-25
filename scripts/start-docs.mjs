import fs from 'node:fs';
import path from 'node:path';
import http from 'node:http';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, '..');
const webDir = path.join(repoRoot, 'web');
const webDeployDir = path.join(repoRoot, 'web_deploy');

const args = process.argv.slice(2);
let port = 8080;
for (let i = 0; i < args.length; i += 1) {
  if (args[i] === '--port' && args[i + 1]) {
    port = Number(args[i + 1]) || port;
  }
}

const run = (cmd, cmdArgs) => {
  const result = spawnSync(cmd, cmdArgs, { cwd: repoRoot, stdio: 'inherit', shell: false });
  if (result.status !== 0) {
    process.exit(result.status || 1);
  }
};

console.log('Generating split OpenAPI root...');
run('node', ['scripts/generate-openapi-root.mjs']);

console.log('Preparing web_deploy...');
fs.rmSync(webDeployDir, { recursive: true, force: true });
fs.mkdirSync(webDeployDir, { recursive: true });
fs.cpSync(webDir, webDeployDir, { recursive: true });

console.log('Bundling OpenAPI YAML/JSON...');
run('redocly', ['bundle', 'spec/openapi.generated.yaml', '-o', 'web_deploy/openapi.yaml']);
run('redocly', ['bundle', 'spec/openapi.generated.yaml', '-o', 'web_deploy/openapi.json', '--ext', 'json']);
run('redocly', ['bundle', 'spec/v3/openapi.yaml', '-o', 'web_deploy/openapi-v3.yaml']);
run('redocly', ['bundle', 'spec/v3/openapi.yaml', '-o', 'web_deploy/openapi-v3.json', '--ext', 'json']);

const mimeTypes = {
  '.html': 'text/html; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.yaml': 'application/yaml; charset=utf-8',
  '.yml': 'application/yaml; charset=utf-8',
  '.js': 'application/javascript; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.ico': 'image/x-icon'
};

const resolveFile = (urlPath) => {
  const raw = decodeURIComponent(urlPath.split('?')[0]);
  const normalized = raw === '/' ? '/index.html' : raw;
  const filePath = path.normalize(path.join(webDeployDir, normalized));
  if (!filePath.startsWith(webDeployDir)) return null;
  return filePath;
};

const server = http.createServer((req, res) => {
  const filePath = resolveFile(req.url || '/');
  if (!filePath) {
    res.statusCode = 400;
    res.end('Bad request');
    return;
  }
  if (!fs.existsSync(filePath) || fs.statSync(filePath).isDirectory()) {
    res.statusCode = 404;
    res.end('Not found');
    return;
  }

  const ext = path.extname(filePath).toLowerCase();
  res.setHeader('Content-Type', mimeTypes[ext] || 'application/octet-stream');
  fs.createReadStream(filePath).pipe(res);
});

server.listen(port, () => {
  console.log(`API docs server listening on http://localhost:${port}`);
});
