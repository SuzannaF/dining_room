# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning database"

Chef.delete_all
User.delete_all

puts "Creating chefs..."

# date = DateTime.new(2020, 8, 25, 22, 12, 0)

3.times do
  chef = Chef.new(
    name: "Joachim Alvarez",
    image: "https://images.unsplash.com/photo-1577219491135-ce391730fb2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=325&q=80",
    description: "Joaquim is a chef from Barcelona, who has been living in Berlin for the past 7 years. He is currently working at Chucha. Joaquim’s proposed menu will take you on a journey to sunny Spanish countryside."
  )
  chef.save!

  puts "Creating users..."

  user = User.new(
    name: ["Bea", "Sandra", "Suzy"].shuffle!.pop,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!

  puts "Done!"

  puts "Creating events..."

  event = Event.new(
    address: "Checkpoint Charlie 22, 10101 Berlin",
    date: Faker::Date.forward(days: 23),
    price: 80,
    capacity: rand(5..20),
    user: user,
    chef: chef
  )
  event.save!
end

puts "Done!"
