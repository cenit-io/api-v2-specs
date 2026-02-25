# API v2 Route Gap Checklist

Source of truth compared:
- Backend routes: `/Users/sanchojaf/Documents/cenit-io/cenit/config/routes.rb` (`namespace :api -> :v2`)
- Current split spec paths: `/Users/sanchojaf/Documents/cenit-io/api-v2-specs/spec/paths/*.yaml`

Status legend:
- `Covered`: route pattern is documented in current spec.
- `Partial`: some behavior is documented indirectly, but endpoint pattern/method is not fully explicit.
- `Missing`: no endpoint documentation found in current spec.

## Priority Order (add first)
- [ ] 1. `POST /api/v2/setup/user`
- [ ] 2. `POST /api/v2/auth/ping`
- [ ] 3. `POST /api/v2/{ns}/{model}/digest`
- [ ] 4. `POST /api/v2/{ns}/{model}/{id}/run`
- [ ] 5. `POST /api/v2/{ns}/{model}/{id}/pull`
- [ ] 6. `GET /api/v2/{ns}/{model}/{id}/retry`
- [ ] 7. `GET /api/v2/{ns}/{model}/{id}/authorize`
- [ ] 8. `GET /api/v2/{ns}/{model}/{id}/{view}`
- [ ] 9. `POST /api/v2/{ns}/push`
- [ ] 10. `GET /api/v2/public/{model}` and `GET /api/v2/public/{model}/{id}`
- [ ] 11. `HEAD /api/v2/auth`
- [ ] 12. `OPTIONS /api/v2/*path` (CORS contract)

## Route-by-Route Checklist

| Method | Backend Route Pattern | Controller Action | Spec Status | Notes / What to add |
|---|---|---|---|---|
| POST | `/api/v2/auth/ping` | `api#auth` | Missing | Add auth ping endpoint under a new `Auth` tag (request/response examples, 200/401). |
| GET | `/api/v2/public/{model}` | `api#index` | Missing | Add generic public read endpoint (no auth) and model constraints/filters. |
| GET | `/api/v2/public/{model}/{id}` | `api#show` | Missing | Add public item read endpoint and response format details. |
| POST | `/api/v2/setup/user` | `api#new_user` | Missing | Add tenant/user bootstrap contract and captcha/token flow cases. |
| POST | `/api/v2/{ns}/push` | `api#push` | Missing | Add bulk ingest/push contract with success/errors structure. |
| POST | `/api/v2/{ns}/{model}` | `api#new` | Partial | Covered for specific setup models only; add generic model contract or explicitly scope spec to setup-only. |
| POST | `/api/v2/{ns}/{model}/digest` | `api#data_type_digest` | Missing | Add digest execution endpoint (task-like response semantics). |
| GET | `/api/v2/{ns}/{model}` | `api#index` | Partial | Covered for specific setup models only; generic list route not documented. |
| GET | `/api/v2/{ns}/{model}/{id}` | `api#show` | Partial | Covered for specific setup models only; generic item read route not documented. |
| POST | `/api/v2/{ns}/{model}/{id}` | `api#update` | Partial | Covered for specific setup models only; generic update route not documented. |
| DELETE | `/api/v2/{ns}/{model}/{id}` | `api#destroy` | Partial | Covered for specific setup models only; generic delete route not documented. |
| POST | `/api/v2/{ns}/{model}/{id}/pull` | `api#pull` | Missing | Add pull operation contract and error behavior. |
| POST | `/api/v2/{ns}/{model}/{id}/run` | `api#run` | Missing | Add run operation contract (algorithm execution response). |
| GET | `/api/v2/{ns}/{model}/{id}/retry` | `api#retry` | Missing | Add retry operation contract and non-retriable cases. |
| GET | `/api/v2/{ns}/{model}/{id}/authorize` | `api#authorize` | Missing | Add authorization URL generation endpoint contract. |
| GET | `/api/v2/{ns}/{model}/{id}/{view}` | `api#content` | Missing | Add content/view projection endpoint and constraints. |
| HEAD | `/api/v2/auth` | `api#auth` | Missing | Add HEAD auth check contract. |
| OPTIONS | `/api/v2/*path` | `api#cors_check` | Missing | Add CORS preflight behavior (headers/status) or declare as out-of-scope. |

## Currently Covered Setup Resources (from `spec/paths`)

These resources appear documented with collection + item endpoints:
- [x] `setup/algorithm`
- [x] `setup/basic_authorization`
- [x] `setup/connection`
- [x] `setup/connection_role`
- [x] `setup/flow`
- [x] `setup/json_data_type`
- [x] `setup/plain_webhook`
- [x] `setup/ruby_converter`
- [x] `setup/ruby_parser`
- [x] `setup/ruby_template`

## Setup Models Explicitly Called By UI API Code

Status is based on whether `spec/paths/setup@<model>.yaml` (+ `@{id}`) exists.

- [x] `Setup::Algorithm` (`setup/algorithm`)
- [x] `Setup::BasicAuthorization` (`setup/basic_authorization`)
- [x] `Setup::Connection` (`setup/connection`)
- [x] `Setup::ConnectionRole` (`setup/connection_role`)
- [x] `Setup::Flow` (`setup/flow`)
- [x] `Setup::JsonDataType` (`setup/json_data_type`)
- [x] `Setup::PlainWebhook` (`setup/plain_webhook`)
- [x] `Setup::RubyConverter` (`setup/ruby_converter`)
- [x] `Setup::RubyParser` (`setup/ruby_parser`)
- [x] `Setup::RubyTemplate` (`setup/ruby_template`)
- [ ] `Setup::Application` (`setup/application`)
- [ ] `Setup::Collection` (`setup/collection`)
- [ ] `Setup::DataType` (`setup/data_type`)
- [ ] `Setup::Template` (`setup/template`)
- [ ] `Setup::Task` (`setup/task`)
- [ ] `Setup::ConverterTransformation` (`setup/converter_transformation`)
- [ ] `Setup::ParserTransformation` (`setup/parser_transformation`)
- [ ] `Setup::UpdaterTransformation` (`setup/updater_transformation`)
- [ ] `Setup::CrossSharedCollection` (`setup/cross_shared_collection`)
- [ ] `Setup::User` (`setup/user`)
- [ ] `Setup::Account` (`setup/account`)

## Decision Needed (before filling all gaps)

- [ ] Decide if this spec is intended to be:
  - `A)` **Full API v2 surface** (document all generic + utility endpoints), or
  - `B)` **Curated setup-resource subset** (then rename/scope docs explicitly and mark non-covered endpoints out-of-scope).

## Suggested Next PR Slices

- [ ] PR 1: Auth + user bootstrap (`/auth/ping`, `/auth` HEAD, `/setup/user`)
- [ ] PR 2: Generic operation endpoints (`/digest`, `/run`, `/pull`, `/retry`, `/authorize`, `/view`)
- [ ] PR 3: Public + push + CORS endpoint docs
- [ ] PR 4: Clarify scope statement in `README.md` and `spec/openapi.yaml` description
