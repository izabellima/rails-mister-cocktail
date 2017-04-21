class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @cocktails = @ingredient.cocktails
  end
end
