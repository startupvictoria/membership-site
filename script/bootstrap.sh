#!/usr/bin/env bash
set -e

# sample environment variables
cp sample.env .env

# gems
bundle

# database setup
rake db:create db:migrate
RAILS_ENV=test rake db:create db:migrate
