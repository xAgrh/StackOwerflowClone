source 'https://rubygems.org'

#ruby-gemset=qna
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass'
gem 'bootstrap-sass-extras'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem 'libv8', '3.16.14.3'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'slim-rails'
gem 'devise'
gem 'carrierwave'
gem 'remotipart'
gem 'nested_form', :git => 'git://github.com/ryanb/nested_form.git'
gem 'select2-rails'
gem 'private_pub'
gem 'thin'
gem 'inherited_resources'
gem 'simple_form'


group :test, :developement do
  gem "rspec-rails", "~> 2.8"
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'childprocess', '0.3.6'
#  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'growl'    # if /darwin/ =~ RUBY_PLATFORM
  gem 'database_cleaner'
#  gem 'capybara-webkit', '1.3.0'
  
end

group :test do
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end