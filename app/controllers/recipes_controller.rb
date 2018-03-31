class RecipesController < ApplicationController
  def index
    authenticate_staff!
    @recipes = Recipe.all
  end

  def new

  end
end
