source 'https://rubygems.org'

# Note: gems are not auto-loaded
# If you need a gem loaded on rails startup, see config/application.rb

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'bcrypt', '~> 3.1.7'
gem 'dotenv-rails'
gem 'draper'
gem 'foreigner'
gem 'foreman'
gem 'haml'
gem 'heroku_rails_deflate', :group => :production
gem 'just-datetime-picker'
gem 'pg'
gem "prawn"
gem "prawn_rails"
gem 'rails', '4.1.1'
gem 'rb-readline'
gem 'sentry-raven'
gem 'stripe'
gem 'turbolinks'
gem 'unicorn'

group :assets do
  gem 'jquery-rails'
  gem 'sass-rails', '~> 4.0.3'
  gem 'uglifier', '>= 1.3.0'
end

group :test do
  gem 'capybara', git: "git@github.com:jnicklas/capybara.git"
  gem 'poltergeist'
  gem 'rspec-rails', '>= 3.0.0.beta2'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end
