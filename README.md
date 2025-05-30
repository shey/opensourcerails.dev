# OpenSourceRails.dev

A directory of open-source Ruby on Rails apps.

Forked from [opensourcerails.org](https://github.com/opensourcerails-org/site).

Originally developed by [joshmn](/joshmn)-- maintained by [shey](/shey).

---

## Setup

1. Clone the repo.
2. Run `bin/setup`.
3. Create a [GitHub Personal Access Token](https://github.com/settings/tokens) with `public_repo` read access.
4. Add it to your `.env`.
5. Start the app with `bin/dev`. App runs on port 4545.

---

## Quirks and Features

- The app includes an `AdminUser` model.
- Admin panel is available at `/admin`.
- Does not use credentials.yml or master.key

---

## Production / Operations

- As of this writing, production runs comfortably under ~800 MB RAM, thanks to aggressive in-memory caching.
- Assume 2 GB RAM for safety.

### Cron via `sidekiq-scheduler`

- `Bulk::Projects::SyncProjectsWorker`: runs every 24h
- `Bulk::Projects::WeeklySyncProjectsWorker`: runs every 7d

---

## Adding Entries

- When adding projects, use the GitHub path format (e.g. `18F/identity-idp`)—not the full URL.
- After creating an entry, run these workers in order:
  1. `scrape_meta`
  2. `scrape_activity`
  3. `scrape_app`

---

## TODOs

- Fix Images?

---
