class Staff::InventoriesController < ApplicationController
  before_action :authenticate_staff_editor!

  def index
    @character = Character.find_by(slug: params[:character_id])
    @components = Ingredient.by_name - @character.ingredients
    @inventories = Inventory.order_by_ingredient_name.where(character: @character)
  end
end
