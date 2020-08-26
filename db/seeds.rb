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
Event.delete_all
Booking.delete_all
Review.delete_all
Menu.delete_all
Dish.delete_all

puts "Creating chefs..."

date_one = DateTime.new(2020, 9, 25, 21, 00, 0)
date_two = DateTime.new(2020, 9, 27, 20, 00, 0)

# ------------ CHEF SEEEDS

chef_one = Chef.new(
  name: "Joachim Alvarez",
  image: "https://images.unsplash.com/photo-1577219491135-ce391730fb2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=325&q=80",
  description: "Joaquim was born in 1985 in Barcelona and as a young boy he used to help his grandparents at the family farm during his summer holidays. That was when he fell in love with food, while helping grow the produce and then learn how to best used them to create the most delicious and simple recipes. His childohood has defined his style as a chef. He has traveled the world, and learned with the locals, how to make the best traditional and in-season dishes."
  )
chef_one.save!

chef_two = Chef.new(
  name: "Niki Nakayama",
  image: "https://images.unsplash.com/photo-1577219491135-ce391730fb2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=325&q=80",
  description: "Joaquim was born in 1985 in Barcelona and as a young boy he used to help his grandparents at the family farm during his summer holidays. That was when he fell in love with food, while helping grow the produce and then learn how to best used them to create the most delicious and simple recipes. His childohood has defined his style as a chef. He has traveled the world, and learned with the locals, how to make the best traditional and in-season dishes."
  )
chef_two.save!

  # ------------ USER SEEDS

  puts "Creating users..."

  user_one = User.new(
    name: "Gabriella Sanchez",
    email: Faker::Internet.email,
    password: "123456"
    )
  user_one.save!

  user_two = User.new(
    name: "Joe Williams",
    email: Faker::Internet.email,
    password: "123456"
    )
  user_two.save!

  # ------------ EVENT SEEDS

  puts "Creating events..."

  event_one = Event.new(
    address: "Bergmannstraße 59, 10961 Berlin",
    date: date_one, #Faker::Date.forward(days: 23),
    description: "Joaquim is a chef from Barcelona, who has been living in Berlin for the past 7 years. He is currently working at Chucha. Joaquim’s proposed menu will take you on a journey to sunny Spanish countryside.",
    price: 80,
    capacity: rand(5..20),
    user: user_one,
    chef: chef_one
    )
  event_one.save!

  event_two = Event.new(
    address: "Linienstraße 75, 10119 Berlin",
    date: date_two,
    description: "Niki was born in Japan, in Tokyo. She moved with her family to Europe when she was a teenager. Despite having spent most of her live in Europe, it was through food, japanese traditional food, that her family kept the conection to her heritage. She has hopened one the most prestigious japanese restaurants here in Berlin and it’s our great pleasure to have her at Dining Room for the first time this evening.",
    price: 80,
    capacity: rand(5..20),
    user: user_one,
    chef: chef_one
    )
  event_two.save!

  event_three = Event.new(
    address: "Brunnenstraße 3, 10119 Berlin",
    date: date_two,
    description: "Niki was born in Japan, in Tokyo. She moved with her family to Europe when she was a teenager. Despite having spent most of her live in Europe, it was through food, japanese traditional food, that her family kept the conection to her heritage. She has hopened one the most prestigious japanese restaurants here in Berlin and it’s our great pleasure to have her at Dining Room for the first time this evening.",
    price: 65,
    capacity: rand(5..20),
    user: user_one,
    chef: chef_one
    )
  event_three.save!

  # ------------ BOOKING SEEDS

  puts "Creating bookings..."

   booking = Booking.new(
    number_people: rand(1..2),
    user: user_one,
    event: event_one
  )
  booking.save!

  # ------------ REVIEW SEEDS

  puts "Creating reviews..."

  review = Review.new(
    comment: "Our host Gabriella was amazing, everything was set up perfectly. Chef Joe Williams food was cooked too perfection.",
    rating: 5,
    booking: booking
  )
  review.save!

  # ------------ MENU SEEDS

  puts "Creating menus..."

  menu_one = Menu.new(
    event: event_one
  )
  menu_one.save!

    menu_two = Menu.new(
    event: event_two
  )
  menu_two.save!

  # ------------ DISH SEEDS

  puts "Creating dishes..."

  dish_one = Dish.new(
    name: "Appetizer",
    description: "Smoked tortilla made with organic free-range eggs, topped with a secret spice mix.",
    image: "https://images.unsplash.com/photo-1595519516956-9d085ab1cd50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    menu: menu_one
  )
  dish_one.save!

  dish_two = Dish.new(
    name: "Main Course",
    description: "Sirloin barbeque grilled, beautifully charred , served with a take on patatas bravas, golden on the outside and soft on the inside, sprinkled with fresh herbs.",
    image: "https://images.unsplash.com/photo-1595519516956-9d085ab1cd50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    menu: menu_one
  )
  dish_two.save!

   dish_three = Dish.new(
    name: "Dessert",
    description: "Warm churros filed with vanilla icecream, sprinkled with sugar and cinamon, served together with a flowerless chocolate cake and fresh strawberries.",
    image: "https://images.unsplash.com/photo-1595519516956-9d085ab1cd50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    menu: menu_one
  )
  dish_three.save!


puts "Done!"
