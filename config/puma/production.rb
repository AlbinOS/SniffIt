# config/puma.rb

threads 8,32
workers 4
preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end
