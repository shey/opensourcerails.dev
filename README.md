# OpenSourceRails.org

A directory of open-source Ruby on Rails apps that [joshmn](/joshmn) thinks are worth talking about for some reason or another.

Have one to suggest? [Click here](https://github.com/opensourcerails-org/suggestions/issues/new).

## Setup

1. Clone the repo
1. `bin/setup`
1. Provision a Classic Personal Access Token from [Github](https://github.com/settings/tokens) with :public_repo read access. Update .env.

## Quirks and features

1. There's an AdminUser model. There's an admin panel at `/admin`

## Production / Operations

1. As of this blame, production hums along nicely at ~800MB of RAM due to a lot of in-memory caching. Assume 2GB to be safe.

### Cron via `sidekiq-scheduler`

1. Bulk::Projects::SyncProjectsWorker:, every: '24h'
1. Bulk::Projects::WeeklySyncProjectsWorker:, every: '7d'

## Adding Entries

1. When adding projects, the "Github Url" is the portion after the domain, "18F/identity-idp" instead of "https://github.com/18F/identity-idp"

1. After Adding an entry, start with "scrape_meta" and "scrape_activity", then "scrape_app"

## Todos

1. Probably test.
1. Remove cloudflare dependency. Move images to local storage.

## Other reading material

* See [VERBIAGE.md](VERBIAGE.md) for what things mean (or try to mean)
* See [OPERATING.md](OPERATING.md) for the disaster recovery plan (e.g. I die)
