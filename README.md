# wine-pex
Wine sniffer app !

Once vagrant vm is up and running, simply go to /vagrant and execute 'RAILS_ENV=development puma -C config/puma.rb -b unix:///tmp/wine-pex-puma.sock'
