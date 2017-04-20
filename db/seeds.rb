require 'json'
require 'open-uri'
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

ingredients = open(url).read

ingredients_hash = JSON.parse(ingredients)

ingredients = ingredients_hash['drinks'].map { |h| h['strIngredient1'] }

cocktail_names = ["margarita", "white russian", "negroni", "sangria",
                  "old fashioned", "mojito", "manhattan",
                  "cosmopolitan", "martini", "glass of milk"]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end



cocktail_names.each do |name|
  cocktail = Cocktail.new(name: name)
  cocktail.ingredients = Ingredient.all.sample(5)
  cocktail.save
end
