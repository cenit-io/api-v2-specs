# CenitIO APIv2 Specifications
[View-On-Line](https://cenit-io.github.io/api-v2-specs)

## Introduction

This repo has official reference of the CenitIO APIv2 specifications. The spec is OpenAPI 3.0.0 (aka swagger).

## Links

- [Reference Documentation (ReDoc)](https://cenit-io.github.io/api-v2-specs)
- OpenAPI Raw Files: [JSON](https://cenit-io.github.io/api-v2-specs/openapi.json) [YAML](https://cenit-io.github.io/api-v2-specs/openapi.yaml)
- [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/eb5947e10923dee87507)

**Warning:** All above links are updated only after Travis CI finishes deployment

## Working on specification
### Install

1. Install [Node JS](https://nodejs.org/)
2. Clone repo and run `npm install` in the repo root

### Usage

#### Starts the development server for API Specification:

```bash
npm start
```

#### Build web_deploy folder with static assets:

```bash
npm run build
```

#### Validates the API specifications:

```bash
npm test
```

#### Deploys to GitHub Pages:

Deploys docs to GitHub Pages. You don't need to run it manually if you have Travis CI configured.

```bash
npm run gh-pages
```
