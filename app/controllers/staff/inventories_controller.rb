class Staff::InventoriesController < ApplicationController
  before_action :authenticate_staff_editor!

  def destroy
    @inventory = Inventory.find(params[:id])
    if @inventory.destroy
      flash[:success] = "#{@inventory.ingredient.name} deleted successfully."
    else
      flash[:alert] = "There was a problem deleting this inventory entry."
    end
    redirect_to staff_user_character_inventories_path(@inventory.character.user, @inventory.character)
  end

  def index
    @character = Character.find_by(slug: params[:character_id])
    @components = Ingredient.by_name - @character.ingredients
    @inventories = Inventory.order_by_ingredient_name.where(character: @character)
  end
end
