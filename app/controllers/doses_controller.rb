class DosesController < ApplicationController
  before_action :set_ingredients, :get_cocktail, only: [:create]
  #before_action :get_cocktail, only: [:create]

  def create
    @new_dose = Dose.new(set_parms)
    @new_dose.cocktail = @cocktail
    if @new_dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      redirect_to cocktail_path(@dose.cocktail)
    else
    end
  end

  private

  def set_parms
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredients
    #@ingredients = Ingredient.all
    @ingredients = Ingredient.order('name ASC')
  end
end
