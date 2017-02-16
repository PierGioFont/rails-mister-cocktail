# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all

filepath = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
file = open(filepath).read
ingredients = JSON.parse(file)
ingredients.each_with_index do |ingredient, ind|
  ingredient[1].each do |ing|
    Ingredient.create(name: ing["strIngredient1"])
  end
end
