class RecipesController < ApplicationController
  def index
    authenticate_staff!
    binding.pry
    @recipes = Recipe.all
  end
end
