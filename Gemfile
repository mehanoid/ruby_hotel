source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'compass-rails',  '~> 2.0.alpha.0'
gem 'bootstrap-sass', '~> 2.3.2.2'
gem 'twitter-bootstrap-rails-confirm'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Fix syntax errors line numbers
gem 'coffee-script', github: 'niallsmart/ruby-coffee-script'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'sugar-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'js-routes'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Markup
gem 'slim-rails'
gem 'simple_form', '~> 3.0.0'

gem 'active_attr'

# Active Record queries
gem 'squeel', github: 'ernie/squeel'

# authorization
gem 'devise'
gem 'devise-i18n'
gem 'cancan'

gem 'enumerize'

gem 'russian'

gem 'inherited_resources'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'

  gem 'guard', '~> 2.2.3'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'zeus'

  gem 'hirb'

  #source maps
  gem 'coffee-rails-source-maps'
end


group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'launchy'
end