class Admin::InventoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @character = Character.find_by(slug: params[:character_id])
    @components = Ingredient.all - @character.ingredients
  end
end
