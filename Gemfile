# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
gem 'sass-rails', '>= 6'
gem 'slim', '~> 4.1'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'simple_form'
gem 'sorcery'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0'
  gem 'factory_bot_rails'
  
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 1.13', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'nokogiri'
  gem 'open-uri'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'database_cleaner-active_record'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'tailwindcss-rails', '~> 0.3.3'
