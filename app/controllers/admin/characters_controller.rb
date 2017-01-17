class Admin::CharactersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @characters = Character.where(archived: false)
  end

  def show
    @character = Character.find_by(slug: params[:id])
    @markdown = new_markdown
  end

  def update
    @character = Character.find_by(slug: params[:id])
    if @character.update(inventory_params)
      redirect_to admin_user_character_path(@character.user, @character)
    else
      render 'admin/inventories/index'
    end
  end

  protected

  def inventory_params
    params.require(:character).permit(inventories_attributes: [:quantity, :ingredient_id])
  end
end
