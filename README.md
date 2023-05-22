This is a simple blog written with Rails 7 and deployed here: https://blogvltc.fly.dev/.

#How to set up the project locally using Docker:
##Build the image
`docker-compose build`

##Create the database
`docker-compose run web bundle exec rails db:create db:migrate db:seed`

##Start the application
`docker-compose up`

#Seeds
Default user roles, an admin user, and some posts are created by default. However, please note that seeds are not idempotent and should only be used for testing purposes.

##Roles
Users have 4 roles: admin, editor, author, and reader. Each role has different permissions. There is a user dashboard available for admins only, accessible here: https://blogvltc.fly.dev/admin/users. To access that page, use the default admin user: "admin@admin.com" with the password: "password".

#Tests
##How to run tests
`docker-compose run web bundle install; bundle exec rspec`

I wanted to demonstate testing at all levels: unit, integration, and feature. I have used RSpec, Capybara, FactoryBot, and Faker gems for testing. Usually, I would also use Rubocop for linting, but I have decided to skip it for this project. I have also used the gem shoulda-matchers for testing validations and associations. In a real-world project, I would also use VCR for testing external API calls and heavily rely on mocks and stubs for testing models and POROs without hitting the database.

#GraphQL
I have tested GraphQL queries and mutations using GraphiQL. It is mounted at "/graphiql" in development environment.

Since most of the app is server-side rendered, I have used GraphQL only as an additional API for posts and comments. I haven't fully integrated GraphQL with Devise, but I found that it can be done using the gem graphql_devise. I have chosen to protect the GraphQL API route with standard Devise authorization, although it can also be done with JWT tokens.

#CSS
That was a very time-consuming part. I've chosen TailwindCSS and turns out it is still difficult to use if you have to write your classes manually, without relying on default components.
