# config/puma/development.rb

# Number of threads to start (min / max)
threads 1,5

# Log files
stdout_redirect 'log/puma.out', 'log/puma.err', true
