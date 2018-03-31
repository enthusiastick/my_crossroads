class RecipeIngredientsController < ApplicationController

  def new
  @recipe_ingredient = RecipeIngredient.new
  end

  def create
  @recipe_ingredient = RecipeIngredient.new(params)

  end

end
