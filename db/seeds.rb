# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "primary_admin", password: "1!Admin!1", admin: 1)

StaticPage.create(title: "Welcome", content: "#WELCOME")
StaticPage.create(title: "Rules", content: "#RULES")