class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :destroy, :update]
  def index
    @cocktails = Cocktail.all.sort_by { |c| c.name }
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktail_path
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
