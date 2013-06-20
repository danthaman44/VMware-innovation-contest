#!/bin/bash

echo "Dropping old DB..."
bundle exec rake db:drop

echo "Creating new DB..."
bundle exec rake db:create

echo "Running migration..."
bundle exec rake db:migrate

echo "Seeding DB..."
bundle exec rake db:seed
