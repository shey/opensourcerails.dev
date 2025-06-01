# frozen_string_literal: true

if Rails.env.development?
  AdminUser.delete_all
  ActsAsTaggableOn::Tag.destroy_all
  Project.destroy_all

  AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  ActsAsTaggableOn::Tag.create!([
    { name: "bunny", data: { stack: true, notable: true } },
    { name: "haml-rails", data: { stack: true } },
    { name: "stripe", data: { stack: true, notable: false } },
    { name: "stimulus-rails", data: { stack: true, notable: true } },
    { name: "importmap-rails", data: { stack: true, notable: false } },
    { name: "rspec-rails", data: { stack: true, notable: true } },
    { name: "apartment", data: { stack: true, notable: true } },
    { name: "delayed_job_active_record", data: { stack: true } },
    { name: "view_component", data: { stack: true, notable: true } },
    { name: "liquid", data: { stack: true, notable: false } },
    { name: "delayed_job", data: { stack: true } },
    { name: "@hotwired/turbo-rails", data: { stack: true, notable: true } },
    { name: "mongoid", data: { stack: true, notable: true } },
    { name: "react_on_rails", data: { stack: true, notable: true } },
    { name: "handlebars", data: { stack: true } },
    { name: "elasticsearch", data: { stack: true, notable: true } },
    { name: "mysql2", data: { stack: true, notable: false } },
    { name: "active_model_serializers", data: { stack: true } },
    { name: "parallel_tests", data: { stack: true, notable: true } },
    { name: "postcss", data: { stack: true, notable: false } },
    { name: "preact", data: { stack: true, notable: true } },
    { name: "haml", data: { stack: true, notable: true } },
    { name: "stimulus", data: { stack: true, notable: true } },
    { name: "bootstrap", data: { stack: true, notable: true } },
    { name: "pg", data: { stack: true, notable: false } },
    { name: "turbolinks", data: { stack: true, notable: true } },
    { name: "elasticsearch-rails", data: { stack: true } },
    { name: "elasticsearch-model", data: { stack: true } },
    { name: "vue", data: { stack: true, notable: true } },
    { name: "backbone", data: { stack: true, notable: true } },
    { name: "react", data: { stack: true, notable: true } },
    { name: "webpack", data: { stack: true } },
    { name: "activemerchant", data: { stack: true } },
    { name: "gon", data: { stack: true } },
    { name: "coffeescript", data: { stack: true } },
    { name: "tailwindcss", data: { stack: true, notable: true } }
  ])

  Project.create!({
    name: "Discourse",
    slug: "discourse",
    rails_major_version: "5",
    github: "discourse/discourse",
    github_about: "A platform for community discussion. Free, open, simple.",
    website: "http://www.discourse.org",
    contributors: "1",
    dependents: "",
    stars: "33895",
    watchers: "1",
    forks: "7344",
    branch: "main",
    meta_last_updated_at: "2021-08-26 18:07:14 UTC",
    description: "next-generation discussion platform",
    short_blurb: "",
    last_activity_at: "2021-08-26 17:38:34 UTC",
    color: "#fbee6a",
    last_commit: "334ec4edb6e370b880f86baa706ddcfd7fe1d7a2",
    hidden_at: "",
    data: {},
    pulse: "",
    category_list: ["Forums", "Collaboration"],
    license_list: ["Other"],
    adjective_list: [],
    app_directory_list: ["assets", "controllers", "helpers", "jobs", "mailers", "models", "serializers", "services", "views"],
    backend_stack_list: ["redis", "pg", "sidekiq"],
    frontend_stack_list: ["bootstrap"]
  })

  Project.create!({
    name: "Mastodon",
    slug: "mastodon",
    rails_major_version: "5",
    github: "mastodon/mastodon",
    github_about: "Your self-hosted, globally interconnected microblogging community",
    website: "",
    contributors: "1",
    dependents: "",
    stars: "24649",
    watchers: "1",
    forks: "4101",
    branch: "main",
    meta_last_updated_at: "2021-08-26 18:05:53 UTC",
    description: "distributed, interconnected microblogging",
    short_blurb: "Some really advanced concepts in this codebase if you're interested in distributed systems.",
    last_activity_at: "2021-08-26 14:51:22 UTC",
    color: "#686a6c",
    last_commit: "60af89149d26d049e25dfe829ae54376a873c2b7",
    hidden_at: "",
    data: {},
    pulse: "",
    category_list: ["Social"],
    license_list: ["GNU Affero General Public License v3.0"],
    adjective_list: ["in-production"],
    app_directory_list: ["chewy", "controllers", "helpers", "javascript", "lib", "mailers", "models", "policies", "presenters", "serializers", "services", "validators", "views", "workers"],
    backend_stack_list: ["pg", "redis", "sidekiq", "webpacker"],
    frontend_stack_list: ["react"]
  })

  Project.create!({
    name: "brainstormer",
    slug: "brainstormer",
    rails_major_version: "5",
    github: "LoneKP/brainstormer",
    github_about: "Brainstormer is a fun tool that helps people come up with ideas together remotely.",
    website: "www.brainstormer.online",
    contributors: "3",
    dependents: "",
    stars: "21",
    watchers: "2",
    forks: "6",
    branch: "main",
    meta_last_updated_at: "2021-08-26 18:05:53 UTC",
    description: "Brainstorm ideas with your friends.",
    short_blurb: "Some really advanced tailwind work.",
    last_activity_at: "2021-08-26 14:51:22 UTC",
    color: "#686a6c",
    last_commit: "b26f3c633da51ddec11ddd15621c34d797952cad",
    hidden_at: "",
    adjective_list: ["in-production"]
  })
end
