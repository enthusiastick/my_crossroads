class Staff::CharacterRecipesController < ApplicationController

def index
  @character = Character.find_by(slug:params[:character_id])
  @recipes = @character.recipes
end
end
