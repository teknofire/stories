source 'https://rubygems.org'

gem 'bundler', '>= 1.8.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'rack-cors'
gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem 'haml'
gem 'redcarpet', require: 'redcarpet'
gem 'simple_form'
gem "mini_magick"
gem "refile", require: "refile/rails"
gem "refile-s3", require: "refile/s3"
gem "refile-mini_magick"
gem 'mixlib-shellout'
gem 'nokogiri'
gem 'acts_as_list'
gem 'friendly_id'
gem 'cancancan', '~> 1.10'
gem 'ransack'
gem "aws-sdk"
gem 'sidekiq'
gem 'foreman'
gem 'rails_12factor'
gem 'version'
gem 'active_link_to'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-jasny-bootstrap'
  gem 'rails-assets-jquery-minicolors'
  gem 'rails-assets-jquery-masonry'
end
gem "font-awesome-rails"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'


  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'guard'
  gem 'guard-minitest'
  gem 'terminal-notifier-guard'
  gem 'quiet_assets'
end

# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development

gem 'puma'
gem 'omniauth'
gem 'omniauth-google-oauth2'

group :development do
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
end
