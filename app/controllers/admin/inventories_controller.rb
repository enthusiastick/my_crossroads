class Admin::InventoriesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @character = Character.find_by(slug: params[:character_id])
    @character.inventories.build
    @components = Ingredient.all
  end
end
