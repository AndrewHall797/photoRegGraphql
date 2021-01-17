# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User1 = User.create(email: "testemail1@email.com", password: "password", password_confirmation:"password")
User2 = User.create(email: "testemail2@email.com", password: "password", password_confirmation:"password")
User3 = User.create(email: "testemail3@email.com", password: "password", password_confirmation:"password")
