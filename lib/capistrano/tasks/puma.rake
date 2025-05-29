namespace :puma do
  desc 'Start puma'
  task :start do
    on roles(:app) do
      info "Starting Puma FRT"
      execute "sudo /usr/sbin/service puma start"
    end
  end

  desc 'Stop puma'
  task :stop do
    on roles(:app) do
      info "Stopping Puma FRT"
      execute "sudo /usr/sbin/service puma stop"
    end
  end

  desc 'Restart puma'
  task :hard_restart do
    on roles(:app) do
      info 'Hard-Restarting Puma'
      invoke 'puma:stop'
      invoke 'puma:start'
    end
  end

  desc 'Restart puma'
  task :restart do
    on roles(:app) do
      info 'Restarting Puma'
      execute "sudo /usr/sbin/service puma restart"
    end
  end

  desc 'Reload puma Config'
  task :reload do
    on roles(:app) do
      info 'Reloading Puma'
      execute "sudo /usr/sbin/service puma reload"
    end
  end
end
