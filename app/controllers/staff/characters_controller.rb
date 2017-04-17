class Staff::CharactersController < ApplicationController
  before_action :authenticate_staff!
  before_action :authenticate_staff_editor!, except: [:index, :show]

  def destroy
    @character = Character.find_by(slug: params[:id])
    @time_string = Time.now.to_formatted_s(:number)
    if @character.update(archived: true, name: "[Archived: #{@time_string}] #{@character.name}", slug: "archived-#{@time_string}-#{@character.slug}")
      flash[:success] = "Character deleted successfully."
      redirect_to staff_characters_path
    else
      flash.now[:alert] = "There was a problem deleting your character."
      render :show
    end
  end

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
    if @character.update(staff_character_params)
      flash[:success] = "Character updated successfully."
      redirect_to staff_user_character_path(@character.user, @character)
    else
      flash.now[:alert] = "There was a problem updating your character."
      render :edit
    end
  end

  protected

  def staff_character_params
    params.require(:character).permit(:name, :slug, :race, :user_id, :alchemist, :drake, :history)
  end
end
