class CharactersController < ApplicationController

  before_action :authenticate_user!

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save
      flash[:success] = "Character created successfully."
      redirect_to characters_path
    else
      flash.now[:alert] = "There was a problem creating your character."
      render :new
    end
  end

  def edit
    @character = Character.find_by(slug: params[:id])
    @user = User.find_by(handle: params[:user_id])
    authorize_record_owner(@user)
  end

  def index
    @characters = current_user.characters.where(archived: false)
  end

  def new
    @character = Character.new
  end

  def show
    @character = Character.find_by(slug: params[:id])
    @user = User.find_by(handle: params[:user_id])
    @markdown = new_markdown
    authorize_record_owner(@user)
  end

  def update
    @character = Character.find_by(slug: params[:id])
    @user = User.find_by(handle: params[:user_id])
    authorize_record_owner(@user)
    if @character.update(update_params)
      flash[:success] = "Character updated successfully."
      redirect_to user_character_path(@user, @character)
    else
      flash.now[:alert] = "There was a problem updating your character."
      render :edit
    end
  end

  protected

  def character_params
    params.require(:character).permit(:name, :race)
  end

  def update_params
    params.require(:character).permit(:history)
  end

end
