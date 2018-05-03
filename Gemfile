source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# AMS
gem 'active_model_serializers'

# Use MySql as the database for Active Record
gem 'mysql2'

# Flexible authentication solution for Rails
gem 'devise'

# Use Puma as the app server
gem 'puma'
gem 'devise-i18n'
gem 'net-ldap'
gem 'omniauth'
gem 'unicorn'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'pry'
  gem 'irbtools', require: 'irbtools/binding'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
  gem 'zeus'
  gem 'rails-erd'
  gem 'rails-controller-testing'
end

group :test do
  gem 'launchy'
end

group :development do
  gem 'listen', '~> 3.1.5'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end
