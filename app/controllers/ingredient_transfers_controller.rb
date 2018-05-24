class IngredientTransfersController < ApplicationController

  def new
    @source_character = Character.find_by(slug: params[:character_id])
    @source_inventory = Inventory.where(character_id: @source_character.id)
    @source_ingredients = []
    @source_inventory.each do |ingredient|
     @source_ingredients<<  ingredient.ingredient
    end
    @characters = Character.where(archived:false)
    @ingredient_transfer = IngredientTransfer.new
  end

  def create
    source_character = Character.find_by(slug: params[:character_id])
    ingredient = Ingredient.find_by_id(params["ingredient_transfer"]["ingredient"].to_i)
    source_inventory = Inventory.where(character:source_character, ingredient:ingredient).first
    transfer_quantity = params["ingredient_transfer"][:quantity].to_i
    target_character = Character.find_by(slug:params["ingredient_transfer"][:target_inventory])
    target_inventory = Inventory.where(character:target_character, ingredient:ingredient).first
    source_total = source_inventory.quantity - transfer_quantity
    if transfer_quantity <= source_inventory.quantity && target_inventory && transfer_quantity > 0
      target_total = target_inventory.quantity + transfer_quantity
      ingredient_transfer = IngredientTransfer.new(
        source_inventory:source_inventory,
        target_inventory:target_inventory,
        quantity:transfer_quantity,
        ingredient:ingredient)
        if ingredient_transfer.save
          source_inventory.update(quantity:source_total)
          target_inventory.update(quantity:target_total)
          flash[:notice] = "You have transferred #{transfer_quantity} #{ingredient.name} to #{target_character.name}"
          redirect_to new_character_ingredient_transfer_path(source_character) and return
        else
          flash[:error] = "There was an error, please try again"
          redirect_to new_character_ingredient_transfer_path(source_character)
        end
    elsif transfer_quantity > source_inventory.quantity
      flash[:error] = "You cannot transfer more #{ingredient.name} than you have (#{source_inventory.quantity})"
      redirect_to new_character_ingredient_transfer_path(source_character) and return
    elsif transfer_quantity == 0
      flash[:error] = "You must transfer at least 1 #{ingredient.name}"
      redirect_to new_character_ingredient_transfer_path(source_character) and return
    else
      target_inventory = Inventory.new(character:target_character, ingredient:ingredient, quantity:transfer_quantity)
      ingredient_transfer = IngredientTransfer.new(
        source_inventory:source_inventory,
        target_inventory:target_inventory,
        quantity:transfer_quantity,
        ingredient:ingredient)
      if target_inventory.save && ingredient_transfer.save &&   source_inventory.update(quantity:source_total)
          flash[:notice] = "You have transferred #{transfer_quantity} #{ingredient.name} to #{target_character.name}"
          redirect_to new_character_ingredient_transfer_path(source_character) and return
        else
          flash[:error] = "There was an error, please try again"
          redirect_to new_character_ingredient_transfer_path(source_character)
        end
    end

  end

  protected
  def transfer_params
    params.require(:ingredient_transfer).permit(:source_inventory_id, :target_inventory_id, :quantity)
  end
end
