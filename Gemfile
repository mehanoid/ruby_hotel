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

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Markup
gem 'slim-rails'
gem 'simple_form', '~> 3.0.0'

# Active Record queries
gem 'squeel'

# authorization
gem 'devise'
gem 'devise-russian'
gem 'cancan'

gem 'enumerize'

gem 'russian'

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

  gem "rb-inotify", require: false
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'guard-spork'
  gem 'spork', '~> 1.0.0rc4'
  gem 'spork-rails'

  gem 'guard-cucumber'
  gem 'guard-rspec'

end


group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'launchy'
end