class Staff::RecipesController < ApplicationController
  before_action :authenticate_staff!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])

  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all.order(:name)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    Recipe.determine_level(@recipe)
    if @recipe.save
      redirect_to staff_recipe_path(@recipe)
    end
  end

protected
  def recipe_params
    params.require(:recipe).permit(
    :extraction_ingredient_id,
    :calcination_ingredient_id,
    :dissolution_ingredient_id,
    :concentration_ingredient_id,
    :name,
    :subtype,
    :category,
    :level,
    :effect_family,
    :delivery,
    :application_time,
    :duration,
    :effect,
    :description
    )
  end

end
