class Staff::CharacterRecipesController < ApplicationController
  before_action :authenticate_staff!

  def index
    @character = Character.find_by(slug: params[:character_id])
    @recipes = @character.recipes
  end

  def new
    if params.include?(:character_id)
      @character = Character.find_by(slug:params[:character_id])
      @recipes = Recipe.all
    elsif params.include?(:recipe_id)
      @recipe= Recipe.find_by(slug:params[:recipe_id])
      @alchemists = Character.includes(:character_professions).where(archived: false, character_professions: { profession_id: 1 })
    end
    @character_recipe = CharacterRecipe.new
  end

  def create
    if params[:character_id]
      @character = Character.find_by(slug: params[:character_id])
      @recipe = Recipe.find_by_id(params[:character_recipe][:recipe_id])
    else
      @recipe = Recipe.find_by(slug: params[:recipe_id])
      @character = Character.find_by_id(params[:character_recipe][:character_id])
    end
    @character_recipe = CharacterRecipe.new(recipe_id:@recipe.id, character_id:@character.id)
    if @character_recipe.save
      redirect_to staff_user_character_character_recipes_path(@character.user, @character)
    else
      flash[:notice] = "Character Already Knows This Recipe"
      redirect_to staff_user_character_character_recipes_path(@character.user, @character)
    end
  end

end
