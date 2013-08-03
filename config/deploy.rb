# RVM
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'default'
set :rvm_type, :user

# Bundler
require "bundler/capistrano"

# General
set :application, "nomelette.co.uk"
set :user, "mikey"
set :keep_releases, 3

set :deploy_to, "/var/www/#{application}"
#set :deploy_via, :copy

set :use_sudo, false

# Git

set :scm, :git
set :repository,  "https://github.com/mikeyhogarth/Nomelette.git"
set :branch, "master"

# VPS

role :web, "162.13.46.231"
role :app, "162.13.46.231"
role :db,  "162.13.46.231", :primary => true
role :db,  "162.13.46.231"

# Passenger

namespace :deploy do
 	task :start do ; end
 	task :stop do ; end
 	task :restart, :roles => :app, :except => { :no_release => true } do
   		run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 	end
	namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
    	from = source.next_revision(current_revision)
      	if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        	run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      	else
        	logger.info "Skipping asset pre-compilation because there were no asset changes"
      	end
  	end
  end
end

namespace :custom do
  
  task :symlinks, :roles => :app do
    logger.info "Starting Symlinks"
    logger.info "creating private config directory"
    run %Q{ln -nfs #{shared_path}/private_config/ #{release_path}/config/}
    logger.info "updating database config"
    run %Q{rm #{release_path}/config/database.yml}
    run %Q{ln -nfs #{shared_path}/database_config/database.yml #{release_path}/config/database.yml}
  end
  task :refresh_sitemaps do
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
  end

end

after "deploy:update", "deploy:cleanup" 
after "deploy:assets:symlink", "custom:symlinks"
after "deploy", "custom:refresh_sitemaps"