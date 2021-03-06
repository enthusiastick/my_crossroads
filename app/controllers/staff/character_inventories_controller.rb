class Staff::CharacterInventoriesController < ApplicationController
  before_action :authenticate_staff_editor!

  def update
    @character = Character.find_by(slug: params[:id])
    if duplicate_ingredient_ids?(params)
      flash.now[:alert] = "There was a problem updating your component inventory."
      @components = Ingredient.all - @character.ingredients
      @inventories = Inventory.order_by_ingredient_name.where(character: @character)
      render 'staff/inventories/index'
    elsif @character.update(inventory_params)
      flash[:success] = "Component inventory updated successfully."
      redirect_to staff_user_character_path(@character.user, @character)
    else
      flash.now[:alert] = "There was a problem updating your component inventory."
      @components = Ingredient.all - @character.ingredients
      @inventories = Inventory.order_by_ingredient_name.where(character: @character)
      render 'staff/inventories/index'
    end
  end

  protected

  def inventory_params
    params.require(:character).permit(inventories_attributes: [:id, :quantity, :ingredient_id, :unlocked_calcination, :unlocked_concentration, :unlocked_dissolution, :unlocked_extraction, :unlocked_crafting, :unlocked_ritual])
  end

  def duplicate_ingredient_ids?(params)
    ingredient_ids = Array.new
    params[:character][:inventories_attributes].values.each { |inventory| ingredient_ids << inventory[:ingredient_id] unless inventory[:ingredient_id].nil?}
    if ingredient_ids.uniq != ingredient_ids
      true
    else
      false
    end
  end
end
