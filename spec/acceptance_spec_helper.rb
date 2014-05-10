require 'spec_helper'

require 'capybara'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.default_driver    = :poltergeist
