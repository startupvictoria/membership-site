require 'spec_helper'

require 'capybara/rails'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_driver    = :poltergeist
