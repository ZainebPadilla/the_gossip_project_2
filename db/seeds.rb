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

Comment.destroy_all
PrivateMessage.destroy_all
TaggedGossip.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

10.times do |index|
  City.create(name: Faker::Address.city.upcase)
end

10.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.yoda,
    email: Faker::Internet.email,
    age: rand(18..100),
    city_id: rand(1..10), 
    password: "jeanPaul42"
  )
end




20.times do
  Gossip.create(
    title: Faker::Movie.title,
    content: Faker::TvShows::DrWho.quote,
    user_id: rand(1..10),
    likes: 0
  )
end



10.times do
  Tag.create(title: "##{Faker::Emotion.noun}")
end


20.times do |index|
  gossip = Gossip.find_by(id: index + 1) 
  next unless gossip 
  tag = Tag.find(rand(1..10))
  TaggedGossip.create(gossip_id: gossip.id, tag_id: tag.id)
end



20.times do
  PrivateMessage.create(content: Faker::Books::Dune.quote, recipient_id: rand(1..10), sender_id: rand(1..10))
end

50.times do
  gossip = Gossip.find_by(id: rand(1..20)) # Changez ici aussi pour éviter les erreurs
  next unless gossip # Ajoutez cette ligne pour éviter une erreur si le gossip n'existe pas

  Comment.create(content: Faker::Books::Lovecraft.sentence, user_id: rand(1..10), gossip_id: gossip.id)
end