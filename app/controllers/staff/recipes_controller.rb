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
    calculated_attributes = Recipe.determine_level(@recipe)
    @recipe.subtype = calculated_attributes["Subtype"]
    @recipe.delivery = calculated_attributes["Delivery"]
    @recipe.level = calculated_attributes["Level"]
    if @recipe.save
      redirect_to staff_recipe_path(@recipe)
    else
      flash[:notice] = "Recipe could not be saved"
      redirect_to staff_recipes_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @category = @recipe.category
    @effect_family = @recipe.effect_family
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(
      extraction_ingredient_id:recipe_params[:extraction_ingredient_id],
      calcination_ingredient_id:recipe_params[:calcination_ingredient_id],
      dissolution_ingredient_id:recipe_params[:dissolution_ingredient_id],
      concentration_ingredient_id:recipe_params[:concentration_ingredient_id],
      name:recipe_params[:name],
      category:recipe_params[:category],
      effect_family:recipe_params[:effect_family],
      application_time:recipe_params[:application_time],
      duration:recipe_params[:duration],
      effect:recipe_params[:effect],
      description:recipe_params[:description],
    )
    calculated_attributes = Recipe.determine_level(@recipe)
    subtype = calculated_attributes["Subtype"]
    delivery = calculated_attributes["Delivery"]
    level = calculated_attributes["Level"]
    @recipe.update(subtype:subtype, delivery:delivery, level:level)
    redirect_to staff_recipe_path(@recipe)
  else
    flash[:notice] = "Recipe could not be saved"
    redirect_to staff_recipes_path
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
    :category,
    :effect_family,
    :application_time,
    :duration,
    :effect,
    :description
  )
end

def update_params
  params.require(:recipe).permit( recipe_params, calculated_attributes(:recipe))

end

end
