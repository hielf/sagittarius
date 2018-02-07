# source 'https://rubygems.org'
# source 'https://ruby.taobao.org'
source 'https://gems.ruby-china.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano3-puma', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
group :production do
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end

gem 'rails-i18n'
gem 'rack-cors', :require => 'rack/cors'
gem 'kaminari'
gem 'ransack'
gem 'ffaker'
gem 'spreadsheet'
gem 'to_xls-rails'
gem 'roo'
gem 'rubyzip', '>= 1.2.1'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: '776037c0fc799bb09da8c9ea47980bd3bf296874'
gem 'axlsx_rails'
gem 'whenever', :require => false
gem 'timeout-extensions'
gem 'parallel'
gem 'wechat'
gem 'httparty'
gem 'geocoder'
gem 'state_machines-activerecord'
#gem 'omniauth-wechat-oauth2'
