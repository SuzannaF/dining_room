# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "cleaning database"

Chef.delete_all
User.delete_all
Event.delete_all
Booking.delete_all
Review.delete_all
Menu.delete_all
Dish.delete_all

puts "Creating chefs..."

date_one = DateTime.new(2021, 4, 25, 19, 00, 0)
date_two = DateTime.new(2021, 4, 27, 20, 00, 0)
date_three = DateTime.new(2020, 8, 15, 18, 00, 0)

# ------------ CHEF SEEEDS

file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449569/joachim-alvarez_wkf5bg.jpg')
chef_one = Chef.new(
  name: "Joachim Alvarez",
  description: "Joaquim was born in 1985 in Barcelona and as a young boy he used to help his grandparents at the family farm during his summer holidays. That was when he fell in love with food, while helping grow the produce and then learn how to best used them to create the most delicious and simple recipes. His childohood has defined his style as a chef. He has traveled the world, and learned with the locals, how to make the best traditional and in-season dishes."
  )
chef_one.photo.attach(io: file, filename: 'alvarez.jpg', content_type: 'image/jpg')
chef_one.save!

file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598605227/BN-EA253_mag091_FR_20140807164948_xrjpf1.jpg')
chef_two = Chef.new(
  name: "Niki Nakayama",
  description: "Niki was born in Japan, in Tokyo. She moved with her family to Europe when she was a teenager. Despite having spent most of her live in Europe, it was through food, japanese traditional food, that her family kept the conection to her heritage. She has hopened one the most prestigious japanese restaurants here in Berlin and it’s our great pleasure to have her at Dining Room for the first time this evening.",
  )
chef_two.photo.attach(io: file, filename: 'niki-nakayama.gif', content_type: 'image/gif')
chef_two.save!

file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449570/marcus_samuelsson_zrhcbu.jpg')
chef_three = Chef.new(
  name: "Marcus Samuelsson",
  description: "Niki was born in Japan, in Tokyo. She moved with her family to Europe when she was a teenager. Despite having spent most of her live in Europe, it was through food, japanese traditional food, that her family kept the conection to her heritage. She has hopened one the most prestigious japanese restaurants here in Berlin and it’s our great pleasure to have her at Dining Room for the first time this evening.",
  )
chef_three.photo.attach(io: file, filename: 'samuelsson.jpg', content_type: 'image/jpg')
chef_three.save!

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

  user_three = User.new(
    name: "Tatiana Borges",
    email: "tatiana.borges@gmail.com",
    password: "123456"
    )
  user_three.save!

  user_four = User.new(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: "123456"
    )
  user_four.save!

  user_five = User.new(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: "123456"
    )
  user_five.save!

  user_six = User.new(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: "123456"
    )
  user_six.save!

  user_seven = User.new(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    password: "123456"
    )
  user_seven.save!

  # ------------ EVENT SEEDS

  puts "Creating events..."

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449578/spanish-image_c1yn6q.jpg')
  event_one = Event.new(
    address: "Bergmannstraße 59, 10961 Berlin",
    date: date_one,
    description: "Joaquim is a chef from Barcelona, who has been living in Berlin for the past 7 years. He is currently working at Chucha. Joaquim’s proposed menu will take you on a journey to sunny Spanish countryside.",
    price: 80,
    capacity: rand(5..20),
    user: user_one,
    chef: chef_one
    )
  event_one.photo.attach(io: file, filename: 'spanish-image.jpg', content_type: 'image/jpg')
  event_one.save!

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449568/cody-chan-FyerbLWRr2M-unsplash_ra6eop.jpg')
  event_two = Event.new(
    address: "Linienstraße 75, 10119 Berlin",
    date: date_two,
    description: "Chef Niki started her culinary journey in her home town, Tokyo. She is renowned for her her technique in traditional sushi and is currently traveling around the world, showcasing her skills. As she’s passing by Berlin, we have the pleasure to introduce her and her sushi menu, Japanese traditional style.",
    price: 80,
    capacity: rand(5..20),
    user: user_two,
    chef: chef_two
    )
  event_two.photo.attach(io: file, filename: 'jap-banner-image.jpg', content_type: 'image/jpg')
  event_two.save!

  event_three = Event.new(
    address: "Brunnenstraße 3, 10119 Berlin",
    date: date_three,
    description: "From Stockholm, Sweden, we are proud to present top chef Marcus Samuelsson.",
    price: 65,
    capacity: rand(5..20),
    user: user_three,
    chef: chef_three
    )
  event_three.save!

  #------------ BOOKING SEEDS

  puts "Creating bookings..."

  booking = Booking.new(
    number_people: rand(1..2),
    user: user_three,
    event: event_three
    )
  booking.save!

  booking_two = Booking.new(
    number_people: rand(1..2),
    user: user_four,
    event: event_three
    )
  booking_two.save!

  booking_three = Booking.new(
    number_people: rand(1..2),
    user: user_five,
    event: event_three
    )
  booking_three.save!

  booking_four = Booking.new(
    number_people: rand(1..2),
    user: user_six,
    event: event_three
    )
  booking_four.save!

  booking_five = Booking.new(
    number_people: rand(1..2),
    user: user_seven,
    event: event_three
    )
  booking_five.save!

  # ------------ REVIEW SEEDS

  puts "Creating reviews..."

  review = Review.new(
    comment: "Our host Lilian was amazing, everything was set up perfectly. Chef Marcus Samuelsson's food was cooked to perfection.",
    rating: 5,
    rating_host: 4,
    booking: booking_two
    )
  review.save!

  review = Review.new(
    comment: "What an amazing experience! I loved being able to meet so many different people and eat the most incredible food.",
    rating: 5,
    rating_host: 5,
    booking: booking_three
    )
  review.save!

  review = Review.new(
    comment: "The host Lilian was pure joy and Marcus's food was to die for.",
    rating: 4,
    rating_host: 5,
    booking: booking_four
    )
  review.save!

  review = Review.new(
    comment: "I will definitely join more of these events, and totally recommend it to food lovers and outgoing Berliners.",
    rating: 5,
    rating_host: 5,
    booking: booking_five
    )
  review.save!

  # ------------ MENU SEEDS

  puts "Creating menus..."

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449575/pexels-cottonbro-4253320_iwszqy.jpg')
  menu_one = Menu.new(
    description: "This evening you will be served a menu that will take you on a journey to beautiful Spanish countryside. The simple but rich flavours of olive oil, tomato and the best beef cut will be paired with a beautiful red wine from the region of Penedès, one hour away from Barcelona. This was one of the first dishes Joaquim perfected with his grandmother. Appetiser and deseart will be a surpising complemente to the main star of the show.",
    event: event_one
    )
  menu_one.photo.attach(io: file, filename: 'menu1.jpg', content_type: 'image/jpg')
  menu_one.save!

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449568/jap-image_ys3hpp.jpg')
  menu_two = Menu.new(
    description: "This evening you will be served a menu that will take on a journey to beautiful consmopolitan Tokyo. Sushi is one the most famous dishes of Japan, however Niki brings you an experience that you can only truly have when visiting the country of the rising sun. Niki will present to you a tasting menu of seven exquisite sushi pieces, considered a lucky number in japan, symbolizing ‘togetherness’.",
    event: event_two
    )
  menu_two.photo.attach(io: file, filename: 'menu2.jpg', content_type: 'image/jpg')
  menu_two.save!

  # ------------ DISH SEEDS

  puts "Creating dishes..."

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449567/chase-daley-mFfLHPr6ZZs-unsplash_tposkt.jpg')
  dish_appetizer_one = Dish.new(
    name: "Appetizer",
    description: "Smoked tortilla made with organic free-range eggs, topped with a secret spice mix.",
    menu: menu_one
    )
  dish_appetizer_one.photo.attach(io: file, filename: 'tortilla.jpg', content_type: 'image/jpg')
  dish_appetizer_one.save!

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449575/pexels-cottonbro-4253320_iwszqy.jpg')
  dish_main_one = Dish.new(
    name: "Main Course",
    description: "Sirloin barbeque grilled, beautifully charred , served with a take on patatas bravas, golden on the outside and soft on the inside, sprinkled with fresh herbs.",
    menu: menu_one
    )
  dish_main_one.photo.attach(io: file, filename: 'sirloin.jpg', content_type: 'image/jpg')
  dish_main_one.save!

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1598449566/bantersnaps-tdDRh4lQga0-unsplash_ljsjbm.jpg')
  dish_dessert_one = Dish.new(
    name: "Dessert",
    description: "Warm churros filed with vanilla icecream, sprinkled with sugar and cinamon, served together with a flowerless chocolate cake and fresh strawberries.",
    menu: menu_one
    )
  dish_dessert_one.photo.attach(io: file, filename: 'churros.jpg', content_type: 'image/jpg')
  dish_dessert_one.save!

  # ------------ DISH SEEDS - MENU TWO

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1599037939/luigi-pozzoli-rwLTQ7eyBx0-unsplash_kzw1nu.jpg')
  dish_appetizer_two = Dish.new(
    name: "Appetizer",
    description: "Rich braised salmon belly shake toro nigiri.",
    menu: menu_two
    )
  dish_appetizer_two.photo.attach(io: file, filename: 'pre-sushi.jpg', content_type: 'image/jpg')
  dish_appetizer_two.save!

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1599037937/david-todd-mccarty-6UXZI33qdfI-unsplash_jceqtv.jpg')
  dish_main_two = Dish.new(
    name: "Main Course",
    description: "All seven pieces are made with seven different types of freshly caught fish and seafood.",
    menu: menu_two
    )
  dish_main_two.photo.attach(io: file, filename: 'main-sushi.jpg', content_type: 'image/jpg')
  dish_main_two.save!

  file = URI.open('https://res.cloudinary.com/dq9sg8kv9/image/upload/v1599037931/mgg-vitchakorn-WOuFgV6VxlQ-unsplash_wbinaf.jpg')
  dish_dessert_two = Dish.new(
    name: "Dessert",
    description: "Soft vanilla cake, infused in mint and sprinkled with premium matcha powder.",
    menu: menu_two
    )
  dish_dessert_two.photo.attach(io: file, filename: 'sushi-dessert.jpg', content_type: 'image/jpg')
  dish_dessert_two.save!


  puts "Done!"
