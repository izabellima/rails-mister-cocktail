class CocktailsController < ActionController::Base
  before_action :find_cocktail, only:[:show, :destroy, :edit, :update]


  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    cocktail.ingredients = @ingredients
    cocktail.save
    redirect_to @cocktail
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path(@cocktail)
  end

  private
  def strong_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end




# list
# show
# create
# edit (add dose)
# edit (delete dose)
