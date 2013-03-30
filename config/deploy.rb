# RVM
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'default'
set :rvm_type, :user

# Bundler
require "bundler/capistrano"

# General
set :application, "nomelette"
set :user, "mikey"

set :deploy_to, "/home/#{user}/#{application}"
#set :deploy_via, :copy

set :use_sudo, false

# Git

set :scm, :git
set :repository,  "https://github.com/mikeyhogarth/Nomelette.git"
set :branch, "master"

# VPS

role :web, "www.nomelette.co.uk"
role :app, "www.nomelette.co.uk"
role :db,  "www.nomelette.co.uk", :primary => true
role :db,  "www.nomelette.co.uk"

# Passenger

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end