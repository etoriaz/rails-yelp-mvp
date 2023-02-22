# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Review.destroy_all
Restaurant.destroy_all

categories = %w[chinese italian japanese french belgian]

puts 'Create restaurant and reviews...'
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: categories.sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  3.times do
    restaurant.reviews.create(
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
  end
end
puts 'Finished! =)'
