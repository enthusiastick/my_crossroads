class Admin::CharactersController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @character = Character.find_by(slug: params[:id])
  end

  def index
    @characters = Character.where(archived: false)
  end

  def show
    @character = Character.find_by(slug: params[:id])
    @markdown = new_markdown
  end

  def update
    @character = Character.find_by(slug: params[:id])
    if @character.update(admin_character_params)
      redirect_to admin_user_character_path(@character.user, @character)
    else
      render :edit
    end
  end

  protected

  def admin_character_params
    params.require(:character).permit(:name, :slug, :race, :user_id, :history)
  end
end
