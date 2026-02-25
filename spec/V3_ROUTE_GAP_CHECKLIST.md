# API v3 Route Gap Checklist

Source of truth:
- Backend routes: `/Users/sanchojaf/Documents/cenit-io/cenit/config/routes.rb` (`namespace :api -> :v3`)
- Draft v3 spec: `/Users/sanchojaf/Documents/cenit-io/api-v2-specs/spec/v3/openapi.yaml`

## Route Coverage

| Method | Backend Route Pattern | Controller Action | Spec Status | Notes |
|---|---|---|---|---|
| POST | `/api/v3/setup/user` | `api#new_user` | Covered | Present in draft spec. |
| POST | `/api/v3/{ns}/{model}` | `api#new` | Covered | Generic create route documented. |
| GET | `/api/v3/{ns}/{model}` | `api#index` | Covered | Generic list route documented. |
| GET | `/api/v3/{ns}/{model}/{id}` | `api#show` | Covered | Generic get-by-id route documented. |
| POST | `/api/v3/{ns}/{model}/{id}` | `api#update` | Covered | Generic update route documented. |
| DELETE | `/api/v3/{ns}/{model}/{id}` | `api#destroy` | Covered | Generic delete route documented. |
| GET/POST/DELETE | `/api/v3/{ns}/{model}/{id}/digest` | `api#digest` | Covered | Digest base path documented. |
| GET/POST/DELETE | `/api/v3/{ns}/{model}/{id}/digest/*digest_path` | `api#digest` | Covered | Nested digest path documented. |
| OPTIONS | `/api/v3/*path` | `api#cors_check` | Covered | Catch-all preflight documented. |

## Next Documentation Passes

- [ ] Add auth details for v3 (if different from v2) with concrete examples.
- [ ] Add per-model examples for the most used UI setup resources.
- [ ] Add request/response examples for digest routes (GET/POST/DELETE).
- [ ] Add explicit error envelope examples (401/403/404/422).
- [ ] Confirm whether `/api/v3/public/*` endpoints should exist or remain v2-only.
