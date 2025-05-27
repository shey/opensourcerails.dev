# OpenSourceRails.org

A directory of open-source Ruby on Rails apps that [joshmn](/joshmn) thinks are worth talking about for some reason or another.

Have one to suggest? [Click here](https://github.com/opensourcerails-org/suggestions/issues/new).

## Setup

* Clone the repo
* `bin/setup`

## Quirks and features

1. There's an AdminUser model. There's an admin panel at `/admin`

## Production / Operations

1. As of this blame, production hums along nicely at ~800MB of RAM due to a lot of in-memory caching. Assume 2GB to be safe.

1. "Cron" scheduled via `sidekiq-scheduler`


## Getting into the code

1. Start with `ScanProjectWorker`.

## Todos

1. Probably test.
1. Remove cloudflare dependency. Move images to local storage.

## Other reading material

* See [VERBIAGE.md](VERBIAGE.md) for what things mean (or try to mean)
* See [OPERATING.md](OPERATING.md) for the disaster recovery plan (e.g. I die)
