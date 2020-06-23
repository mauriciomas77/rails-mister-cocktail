# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
puts "Clearing database..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all
puts "Creating new items.."
ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
get_ingredients = open(ingredients_url).read
get_cocktails = open(cocktails_url).read
JSON.parse(get_ingredients)["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
JSON.parse(get_cocktails)["drinks"].each do |cocktail|
  Cocktail.create!(
    name: cocktail['strDrink'],
    )
end
puts "Items created : #{Cocktail.count}"
