# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Role.destroy_all
Role.create(id: 1, title: "admin")
Role.create(id: 2, title: "editor")
Role.create(id: 3, title: "writer")
Role.create(id: 4, title: "readonly")
