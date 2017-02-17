class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(set_parms)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @new_dose = Dose.new
    @ingredients = Ingredient.all
  end

  private

  def set_parms
    params.require(:cocktail).permit(:name, :picture)
  end
end
