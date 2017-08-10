# config valid only for current version of Capistrano
lock "3.8.2"

set :rbenv_type, :system
set :rbenv_ruby, '2.3.1'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_path, "/home/#{ENV.fetch('APISYNC_DEPLOY_USER')}/.rbenv"

set :application, "apisync_api_docs"
set :repo_url, "git@github.com:apisync/api-docs.git"

set :deploy_to, "/var/www/apisync_api_docs"

set :pty, true

set :default_environment, {
  'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH'
}

set :keep_releases, 5

after "deploy:updated", "deploy:build"

namespace :deploy do
  task :build do
    on roles(:web) do
      within "/var/www/apisync_api_docs/current" do
        execute :bundle, :exec, :middleman, :build
      end
    end
  end
end
