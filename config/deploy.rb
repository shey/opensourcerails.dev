# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

# server settings
set :application, "osr"
set :repo_url, "git@github.com:shey/opensourcerails.dev.git"
set :user, "rails"
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :ssh_options, {forward_agent: true}

# rbenv settings
set :rbenv_type, :user
set :rbenv_roles, [:app, :db]

# Bundler settings
set :bundle_jobs, "1"
set :bundle_roles, [:app, :db]

# output
set :format, :airbrussh
set :log_level, :info

# multistage
set :default_staging, "production"

set :linked_files, %w[.env]
set :linked_dirs, fetch(:linked_dirs, []).push(*%w[log pids bundle])

set :assets_roles, [:web, :app]
set :branch, ENV["BRANCH"] || "main"

before :deploy, "deploy:confirm"
after "deploy:starting", "sidekiq:quiet"

namespace :deploy do
  desc "Setup shared deploy directories"
  task :setup do
    invoke "git:check"
    invoke "deploy:check:directories"
    invoke "deploy:check:linked_dirs"
    invoke "deploy:check:make_linked_dirs"
  end

  desc "Prompt for user confirmation for production deploy"
  task :confirm do
    if fetch(:stage) == :production
      puts "Are you sure you want to deploy to production? (yes/no)"
      ask(:answer, "no")
      unless fetch(:answer) == "yes"
        puts "Exiting deploy"
        exit
      end
    end
  end

  desc "Stop everything!"
  task :stop do
    invoke "puma:stop"
    invoke "sidekiq:stop"
  end

  desc "Start everything"
  task :start do
    invoke "puma:start"
    invoke "sidekiq:start"
  end

  desc "Restart application"
  task :restart do
    on roles(:app, :sidekiq), in: :sequence, wait: 5 do
      invoke "puma:restart"
      invoke "sidekiq:restart"
    end
  end

  after :publishing, :restart
end
