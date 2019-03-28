class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:restaurant_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(review_params)
    @dose.cocktail = Cocktail.find(params[:restaurant_id])
    @dose.ingredient = Ingredient.find(params[:restaurant_id])
    @dose.save
    #redirect_to restaurant_path(@review.restaurant)
  end

  def destroy
    dose.destroy
  end

  private

  def review_params
    params.require(:dose).permit(:amount, :description)
  end
end
