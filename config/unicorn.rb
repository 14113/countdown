root = "/home/deployer/apps/countdown/current"
working_directory root
pid "#{root}/tmp/pids/unicorn_countdown.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.countdown.sock"
worker_processes 2
timeout 30