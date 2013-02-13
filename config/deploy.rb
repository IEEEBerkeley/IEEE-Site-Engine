require "bundler/capistrano"

set :application, "IEEE Main Site"
set :repository,  "git://github.com/IEEEBerkeley/IEEE-Site-Engine.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :scm, "git"
set :user, "deployer"  # The server's user for deploys

set :branch, "master"
set :deploy_via, :remote_cache

set :deploy_to, "/srv/ieee-main"

role :web, "ieee.berkeley.edu"                          # Your HTTP server, Apache/etc
role :app, "ieee.berkeley.edu"                          # This may be the same as your `Web` server
role :db,  "ieee.berkeley.edu", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd /srv/ieee-main/current && source /etc/thin/set-secret-keys.sh && bundle exec thin restart -C /etc/thin/ieee-main.yml"
    run "#{sudo} /etc/init.d/nginx restart"
  end
end
