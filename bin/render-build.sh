#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

# bundle exec rails db:migrate

# bundle install; bundle exec rake assets:precompile; bundle exec rake assets:clean; ./bin/render-build.sh; ./bin/rails db:migrate