if ENV['RAILS_ENV'] == 'production'
  APP_ROOT = '/var/www/discoursehub'
  num_workers = ENV["NUM_WEBS"].to_i > 0 ? ENV["NUM_WEBS"].to_i : 4
  workers "#{num_workers}"
  threads 8,32
  port 3000
  stdout_redirect "#{APP_ROOT}/log/puma.log","#{APP_ROOT}/log/puma.err.log"
  pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
  state_path "#{APP_ROOT}/tmp/pids/puma.state"
  preload_app!
end
