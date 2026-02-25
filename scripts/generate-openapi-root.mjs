import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'yaml';

const repoRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const specDir = path.join(repoRoot, 'spec');
const rootFile = path.join(specDir, 'openapi.yaml');
const outFile = path.join(specDir, 'openapi.generated.yaml');

const readYaml = (filePath) => yaml.parse(fs.readFileSync(filePath, 'utf8'));

const base = readYaml(rootFile) || {};

const paths = {};
const pathsDir = path.join(specDir, 'paths');
for (const file of fs.readdirSync(pathsDir).sort((a, b) => a.localeCompare(b))) {
  if (!file.endsWith('.yaml')) continue;
  const route = `/${file.replace(/\.yaml$/, '').replace(/@/g, '/')}`;
  paths[route] = readYaml(path.join(pathsDir, file));
}

const components = {};
const componentsDir = path.join(specDir, 'components');
const componentKinds = fs
  .readdirSync(componentsDir, { withFileTypes: true })
  .filter((entry) => entry.isDirectory())
  .map((entry) => entry.name)
  .sort((a, b) => a.localeCompare(b));

for (const kind of componentKinds) {
  const kindDir = path.join(componentsDir, kind);
  const values = {};
  for (const file of fs.readdirSync(kindDir).sort((a, b) => a.localeCompare(b))) {
    if (!file.endsWith('.yaml')) continue;
    const key = file.replace(/\.yaml$/, '');
    values[key] = readYaml(path.join(kindDir, file));
  }
  components[kind] = values;
}

base.paths = paths;
base.components = components;

fs.writeFileSync(outFile, yaml.stringify(base), 'utf8');
console.log(`Generated ${path.relative(repoRoot, outFile)}`);
