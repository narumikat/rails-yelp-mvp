# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning the database...'

Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants....'

restaurants = []

20.times do |i|
  restaurants << Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: %w[chinese japanese french italian belgian].sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
end

puts 'Restaurants created!'

puts 'Creating reviews...'

restaurants.each do |restaurant|
  10.times do
    Review.create!(
      content: Faker::Lorem.sentence(word_count: 17),
      rating: rand(0..5),
      restaurant: restaurant
    )
  end
end

puts 'Reviews created!'