# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

berto = User.create(first_name: "Berto", last_name: "degli Amanti", email: "berto@esempio.it", password: 1, administrator: true)

gianni = User.create(first_name: "Gianni", last_name: "Rivera", email: "gianni@esempio.it", password: 2, administrator: false)
