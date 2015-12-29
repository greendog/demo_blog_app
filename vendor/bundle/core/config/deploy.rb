lock '3.4.0'

set :git_strategy, SubmoduleStrategy
set :stages, %w(development production)
set :default_stage, 'development'
set :shared_children, %w(config tmp tmp/pids tmp/cache tmp/sockets tmp/sessions backup log system)
set :use_sudo, false
set :pty, true
set :keep_releases, 5
set :scm_verbose, true
set :deploy_via, :remote_cache
set :scm, :git
set :sidekiq_default_hooks, false
set :branch, ask(:branch_name, "Tag/branch to deploy: ")
set :user, ask(:username, "Enter username: ")
set :app_server, :unicorn unless any?(:app_server)
set :web_server, :nginx unless any?(:web_server)
set :application_port, 80 unless any?(:application_port)
set :application_uses_ssl, true unless any?(:application_uses_ssl)
set :application_port_ssl, 443 unless any?(:application_port_ssl)
