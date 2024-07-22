# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "rest-client"
require "json"

User.destroy_all
Article.destroy_all
Comment.destroy_all
Bookmark.destroy_all

# creates user seeds
u1 = User.create!(email: "dimitra@email.com", password: "123456", username: "Dimitra")
u2 = User.create!(email: "heena@email.com", password: "123456", username: "Heena")
u3 = User.create!(email: "judith@email.com", password: "123456", username: "Judith")
u4 = User.create!(email: "max@email.com", password: "123456", username: "Max")
u5 = User.create!(email: "test@email.com", password: "123456", username: "ProTester")

# creates article seeds
puts "seeding successful"
