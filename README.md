How to setup the project locally using docker:

# Build the image
docker-compose build

# Create the database
docker-compose run web bundle exec rails db:create db:migrate db:seed

# Start the application
docker-compose up
