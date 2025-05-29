namespace :sidekiq do
  desc "Start Sidekiq"
  task :start do
    on roles(:sidekiq) do
      info "[sidekiq:start] Starting Sidekiq"
      execute "sudo /usr/sbin/servcie sidekiq start"
    end
  end

  desc "Stop Sidekiq"
  task :stop do
    on roles(:sidekiq) do
      # term defaults to 25 seconds to finish processing
      info "[sidekiq:stop] Stopping Sidekiq"
      execute "sudo /usr/sbin/service sidekiq stop"
    end
  end

  desc "Quiet Sidekiq"
  task :quiet do
    on roles(:sidekiq) do
      # tells sidekiq to stop accepting new work
      info "[sidekiq:reload] Quietting Sidekiq"
      execute "sudo /usr/sbin/service sidekiq reload || true"
    end
  end

  desc "Restart Sidekiq"
  task :restart do
    on roles(:sidekiq) do
      info "[sidekiq:restart] Restarting Sidekiq"
      execute "sudo /usr/sbin/service sidekiq restart"
    end
  end
end
