set :rails_env, 'development'
set(:application, 'blog_app')
set :domain, "develop.blogapp.com"

role :app, fetch(:domain)
role :web, fetch(:domain)
role :db, fetch(:domain), :primary => true

set :rvm_type, :user
set :rvm_ruby_version, '2.2.3@blog_app'

set :repo_url, "git@bitbucket.org:greendog/blog_app.git"
set :bundle_without, 'test'

set :ssh_options, {
    user: 'user',
    forward_agent: true,
    port: 22
}

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log files tmp public/system public/uploads}

set :deploy_to, "/srv/apps/#{fetch(:application)}/development"
set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :unicorn_config_file_path, "/srv/apps/#{fetch(:application)}/development/current/config/unicorn/development.rb"

after :deploy, 'sidekiq:stop'
after :deploy, 'sidekiq:start'
after :deploy, 'unicorn:restart'
