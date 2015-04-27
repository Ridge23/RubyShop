# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = AdminUser.new(
    :email                 => "admin@example.com",
    :password              => "adminadmin",
    :password_confirmation => "adminadmin"
)
user.save!

categories = Category.create([{ name: 'Clothes' }, { name: 'Bikes' }, { name: 'Tools' } ])

items = Item.create([
  { name: 'BikeStar 1-1', price: 1000, short_description: 'short description for bikestar 1-1', description: 'Description for bikestar 1-1', category_id: 2 },
  { name: 'BikeStar 1-2', price: 1099, short_description: 'short description for bikestar 1-2', description: 'Description for bikestar 1-2', category_id: 2 },
  { name: 'BikeStar 1-3', price:  999, short_description: 'short description for bikestar 1-3', description: 'Description for bikestar 1-3', category_id: 2 },
  { name: 'BikeStar 1-4', price: 1299, short_description: 'short description for bikestar 1-4', description: 'Description for bikestar 1-4', category_id: 2 },
  { name: 'BikeStar 1-5', price: 1112, short_description: 'short description for bikestar 1-5', description: 'Description for bikestar 1-5', category_id: 2 },
  { name: 'BikeStar 1-5', price: 1132, short_description: 'short description for bikestar 1-6', description: 'Description for bikestar 1-6', category_id: 2 }
])