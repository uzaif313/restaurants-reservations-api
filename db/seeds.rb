# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Load Guest'
5.times do
  Guest.find_or_create_by(email: Faker::Internet.email) do |guest|
    guest.name = Faker::Name.name
  end
  print '------'
end

p 'Load Restaurant'
5.times do
  Restaurant.find_or_create_by(email: Faker::Internet.email) do |restaurant|
    restaurant.name = Faker::Name.name
    restaurant.phone = Faker::PhoneNumber.cell_phone
  end
  print '------'
end

p 'Load Restaurant Shift'
5.times do
  RestaurantShift.find_or_create_by(shift_name: Faker::Name.name) do |restaurant_shift|
    restaurant_shift.restaurant = Restaurant.all.sample
    restaurant_shift.start_at = Time.now - rand(5).hours
    restaurant_shift.end_at = Time.now + rand(2).hours
  end
  print '------'
end

p 'Load Restaurant Table'
5.times do
  RestaurantTable.find_or_create_by(table_name: Faker::Name.name) do |restaurant_table|
    restaurant_table.restaurant = Restaurant.all.sample
  end
  print '------'
end
