class Staff::InventoriesController < ApplicationController
  before_action :authenticate_staff!

  def index
    @character = Character.find_by(slug: params[:character_id])
    @components = Ingredient.by_name - @character.ingredients
  end
end
