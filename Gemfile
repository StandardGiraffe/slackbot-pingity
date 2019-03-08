
source 'https://rubygems.org'

# Pingity gem integration
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
gem 'pingity', git: "https://github.com/StandardGiraffe/pingity-gem.git"

gem 'slack-ruby-client'
gem 'slack-ruby-bot'
gem 'puma'
gem 'sinatra'
gem 'dotenv'
gem 'celluloid-io'
gem 'slack-notifier'

group :development, :test do
  gem 'rake'
  gem 'foreman'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'vcr'
  gem 'webmock'
end
