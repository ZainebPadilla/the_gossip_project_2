# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

PrivateMessage.destroy_all
TaggedGossip.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all


10.times do
    City.create(
      name: Faker::Address.city,
      zip_code: Faker::Address.zip_code
    )
  end
  
  # Associer chaque utilisateur à une ville de façon aléatoire
  cities = City.all
  
  10.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph,
      email: Faker::Internet.email,
      age: Faker::Number.between(from: 18, to: 65),
      city: cities.sample # Associer à une ville aléatoire
    )
  end
  
  20.times do
    Gossip.create(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      user: User.order('RANDOM()').first # Associe à un utilisateur aléatoire
    )
  end