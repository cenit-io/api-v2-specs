# CenitIO APIv2 Specifications
[View-On-Line](https://cenit-io.github.io/api-specs)

## Introduction

This repo contains the Cenit API v2 specification in OpenAPI 3.0.

Current documentation target is organized in three layers:

1. Generic API v2 contract
2. Key built-in `Setup::*` models (selected, high-value coverage)
3. Custom Data Type API examples (dynamic model usage)

## Links

- [Reference Documentation (ReDoc)](https://cenit-io.github.io/api-specs)
- OpenAPI Raw Files: [JSON](https://cenit-io.github.io/api-specs/openapi.json) [YAML](https://cenit-io.github.io/api-specs/openapi.yaml)
- API v3 Raw Files (draft): [JSON](https://cenit-io.github.io/api-specs/openapi-v3.json) [YAML](https://cenit-io.github.io/api-specs/openapi-v3.yaml)
- [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/eb5947e10923dee87507)

**Warning:** All above links are updated only after Travis CI finishes deployment

## Specification structure

### 1) Generic API v2 contract

Document the shared route patterns and common headers/parameters for:

- `/api/v2/{namespace}/{model}`
- `/api/v2/{namespace}/{model}/{id}`
- `/api/v2/public/{model}`

This is the canonical behavior layer that applies to both built-in and custom models.

### 2) Key built-in DataType models

Provide explicit path coverage for selected built-in setup resources already represented in this repo:

- `Setup::JsonDataType`
- `Setup::Flow`
- `Setup::Connection`
- `Setup::ConnectionRole`
- `Setup::Algorithm`
- `Setup::RubyParser`
- `Setup::RubyConverter`
- `Setup::RubyTemplate`
- `Setup::PlainWebhook`
- `Setup::BasicAuthorization`

Add the remaining built-in `Setup::*` models explicitly called by UI API code:

- `Setup::Application`
- `Setup::Collection`
- `Setup::DataType`
- `Setup::Template`
- `Setup::Task`
- `Setup::ConverterTransformation`
- `Setup::ParserTransformation`
- `Setup::UpdaterTransformation`
- `Setup::CrossSharedCollection`
- `Setup::User`
- `Setup::Account`

These paths live under `/Users/sanchojaf/Documents/cenit-io/api-specs/spec/paths`, with progress tracked in the gap checklist.

### 3) Custom Data Type examples

Include practical examples showing how a tenant-defined Custom Data Type is consumed via the generic API routes:

- list records
- create record
- update record
- delete record

Examples should demonstrate payload shape, auth headers, and common query parameters.

## Current completeness status

- Route-by-route coverage tracking is maintained in:
  - `/Users/sanchojaf/Documents/cenit-io/api-specs/spec/V2_ROUTE_GAP_CHECKLIST.md`
- Current OpenAPI files represent a strong built-in setup-model baseline, with generic/custom API layers still being expanded.

## Working on specification
### Install

1. Install [Node JS](https://nodejs.org/)
2. Clone repo and run `npm install` in the repo root

### Usage

#### Start local docs preview:

```bash
npm start
```

#### Build `web_deploy` (static site + bundled OpenAPI YAML/JSON):

```bash
npm run build
```

#### Validate/lint OpenAPI:

```bash
npm test
```

#### Validate/lint OpenAPI v3:

```bash
npm run test:v3
```

### Notes

- This repo now uses **Redocly CLI** (`@redocly/cli`) for linting/bundling/preview.
- `spec/openapi.generated.yaml` is generated from split files:
  - `spec/openapi.yaml` (base metadata)
  - `spec/paths/*.yaml`
  - `spec/components/**.yaml`
- API v3 draft lives at:
  - `spec/v3/openapi.yaml`
  - checklist: `spec/V3_ROUTE_GAP_CHECKLIST.md`
- Local docs preview supports `?spec=v3`:
  - `http://localhost:8080/?spec=v3`
