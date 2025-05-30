set :rails_env, 'production'

role :app, %w{rails@opensourcerails.dev}
role :db, %w{rails@opensourcerails.dev}
role :sidekiq, %w{rails@opensourcerails.dev}
