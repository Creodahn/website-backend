# Change to match your CPU core count `grep -c processor /proc/cpuinfo`
workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

ssl_key = ENV['SSL_KEY']
ssl_cert = ENV['SSL_CERT']

if ssl_key and ssl_cert
  ssl_bind '127.0.0.1', '9292', { key: ssl_key, cert: ssl_cert }
end

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
