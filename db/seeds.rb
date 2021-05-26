# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Restaurant.destroy_all
puts 'seeding 5 restaurants each with between 1-5 reviews...'
5.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address
  phone_number = Faker::PhoneNumber.cell_phone
  category = %w[chinese italian japanese french belgian].sample
  restaurant = Restaurant.create!(name: name, address: address, phone_number: phone_number, category: category)

  rand(1..5).times do
    Review.create!(rating: rand(0..5), restaurant: restaurant, content: Faker::Lorem.paragraph)
  end
end
puts 'seeding complete'
