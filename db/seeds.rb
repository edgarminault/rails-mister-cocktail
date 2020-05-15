# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

url_bis = "https://gist.githubusercontent.com/renandanton/8d99dab65bf9fb5b4465ded7ab73a7df/raw/2c5e0480bd239f76b055bb09f236f365e1530634/cocktails.json"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
puts 'Creating ingredients from the JSON.'
ingredients["drinks"].each do |element|
  ingredient = Ingredient.new(name: element["strIngredient1"])
  ingredient.save
end
puts 'All ingredients added!'

drinks_serialized = open(url_bis).read
drinks = JSON.parse(drinks_serialized)

puts 'Creating cocktails from the JSON.'

drinks["cocktails"].each do |element|
  p element
  cocktail_name = element["name"]
  cocktail_url = element["image"]
  image = URI.open(cocktail_url)
  cocktail = Cocktail.new(name: cocktail_name)
  cocktail.photo.attach(io: image, filename: 'nes.png', content_type: 'image/png')
  cocktail.save!
  puts 'Cocktail added.'
end
puts 'All cocktails added.'

# puts 'Creating 20 fake virgin cocktails...'
# 20.times do
#   cocktail = Cocktail.new(
#     name: Faker::DcComics.villain
#   )
#   cocktail.save!
#   puts 'Cocktail added.'
# end
# puts 'All cocktails added.'
