# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "betapub"
set :repo_url, "git@github.com:UMNLibraries/betapub.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch,  ENV['branch'] || 'master'

set :deploy_user, 'swadm'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/swadm/usr/local/#{fetch(:application)}"

# Needed for Passenger 5+
set :passenger_restart_with_touch, true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
set :linked_files, fetch(:linked_files, []).push('db/development.sqlite3', 'config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/cache')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:app) do
      execute "JAVA_HOME=/swadm/usr/java #{fetch(:release_path)}/vendor/solr/bin/solr restart -noprompt"
      execute "JAVA_HOME=/swadm/usr/java #{fetch(:release_path)}/vendor/solr/bin/post -c betapub #{fetch(:release_path)}/data/publication-data.json"
    end
  end

end
