# config valid only for current version of Capistrano
lock "3.7.2"

set :application, 'release-bot'
set :repo_url, 'https://github.com/chris25ab/release-bot.git'

set :rvm_ruby_version, (ENV['RVM_RUBY_STRING'] || 'ruby-2.2.6')

server ENV['WORKER_SERVER'], user: 'deployer', roles: %w{worker}

branch = ENV['GIT_BRANCH'].gsub('origin/', '') if ENV['GIT_BRANCH']
# Prefer the git commit for capistrano-deploytags gem
branch = ENV['GIT_COMMIT'] if ENV['GIT_COMMIT']
branch = 'develop' if branch.nil?

set :branch, branch

set :deploy_to, '/www/release-bot'

set :ssh_options, { forward_agent: true }

namespace :deploy do
end
