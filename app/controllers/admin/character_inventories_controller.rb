class Admin::CharacterInventoriesController < ApplicationController
  before_action :authenticate_admin!

  def update
    @character = Character.find_by(slug: params[:id])
    if duplicate_ingredient_ids?(params)
      flash.now[:alert] = "There was a problem updating your component inventory."
      @components = Ingredient.all - @character.ingredients
      render 'admin/inventories/index'
    elsif @character.update(inventory_params)
      flash[:success] = "Component inventory updated successfully."
      redirect_to admin_user_character_path(@character.user, @character)
    else
      flash.now[:alert] = "There was a problem updating your component inventory."
      @components = Ingredient.all - @character.ingredients
      render 'admin/inventories/index'
    end
  end

  protected

  def inventory_params
    params.require(:character).permit(inventories_attributes: [:id, :quantity, :ingredient_id])
  end

  def duplicate_ingredient_ids?(params)
    ingredient_ids = Array.new
    params[:character][:inventories_attributes].values.each { |inventory| ingredient_ids << inventory[:ingredient_id] }
    if ingredient_ids.uniq != ingredient_ids
      true
    else
      false
    end
  end
end
