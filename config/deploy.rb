# config valid only for current version of Capistrano
lock "3.8.2"

set :rbenv_type, :system
set :rbenv_ruby, '2.3.1'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_path, '/home/devops/.rbenv'

set :application, "apisync_api_docs"
set :repo_url, "git@github.com:apisync/api-docs.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/apisync_api_docs"
#role :web, "veiculo.online"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
set :default_environment, {
  'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH'
}

set :keep_releases, 5

after "deploy", "deploy:build"

namespace :deploy do
  task :build do
    on roles(:web) do
      execute :bundle, "rake build"
    end
  end
end
