class Admin::ComponentsController < ApplicationController
  before_action :authenticate_staff!

  def create
    @component = Ingredient.new(ingredient_params)
    if @component.save
      flash[:success] = "Component created successfully."
      redirect_to staff_components_path
    else
      flash.now[:alert] = "There was a problem creating your component."
      @professions = Profession.all
      @seasons = Season.all
      render :new
    end
  end

  def destroy
    @component = Ingredient.find(params[:id])
    if @component.update(archived: true)
      flash[:success] = "Component deleted successfully."
      redirect_to staff_components_path
    else
      flash.now[:alert] = "There was a problem deleting your component."
      render :edit
    end
  end

  def edit
    @component = Ingredient.find(params[:id])
    @professions = Profession.all
    @seasons = Season.all
  end

  def index
    @components = Ingredient.where(archived: false).order(:name)
    @professions = Profession.all.map(&:name)
    @seasons = Season.all.map(&:name)
  end

  def new
    @component = Ingredient.new
    @professions = Profession.all
    @seasons = Season.all
  end

  def show
    @component = Ingredient.find(params[:id])
  end

  def update
    @component = Ingredient.find(params[:id])
    if @component.update(ingredient_params)
      flash[:success] = "Component updated successfully."
      redirect_to staff_components_path
    else
      flash.now[:alert] = "There was a problem updating your component."
      @professions = Profession.all
      @seasons = Season.all
      render :edit
    end
  end

  protected

  def ingredient_params
    params.require(:ingredient).permit(:name, :code, :level, :category, :rarity, :primary, :secondary, :tertiary, :staff_notes, profession_ids: [], season_ids: [])
  end
end
