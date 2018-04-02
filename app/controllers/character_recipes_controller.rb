class CharacterRecipesController < ApplicationController

  def index
    @character = Character.find_by(slug:params[:character_id])
    binding.pry
    @recipes = @character.recipes
  end

end
