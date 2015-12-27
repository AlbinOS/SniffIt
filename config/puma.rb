# config/puma.rb
case environment ENV['RAILS_ENV']
when 'development'
  threads 2,8
  workers 2
when 'production'
  threads 8,32
  workers 4
  preload_app!

  on_worker_boot do
    ActiveRecord::Base.establish_connection
  end
end
