class RecipesController < ApplicationController
  def index
    authenticate_staff!
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(slug:params[:id])
  end
end
