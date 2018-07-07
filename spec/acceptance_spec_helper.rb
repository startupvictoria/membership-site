require 'spec_helper'

require 'capybara'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    js_errors: true,
    phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any'],
    timeout: 240
  })
end
Capybara.default_driver = :poltergeist
Capybara.default_max_wait_time = 10
