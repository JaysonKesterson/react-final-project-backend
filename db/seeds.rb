# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jayson = User.create(name: "Jayson", email: "jayson.kesterson24@gmail.com", password: "Jnapk1ns", balance: 100.00)
store = Store.create(user_id: 1, name: "Used Items")
driver = Item.create(store_id: 1, price: "$40.00", name: "v300 Driver", description: "Golf Driver from the v300 set, 460cc and 10.5 degree loft", condition: 6)


