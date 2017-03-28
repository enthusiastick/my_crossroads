class Admin::FiltersController < ApplicationController
  before_action :authenticate_staff!

  def show
    @filter_param = params[:id]
    @professions = Profession.all.map(&:name)
    @seasons = Season.all.map(&:name)
    if @filter_param.include?("-")
      @profession = Profession.find_by(name: @filter_param.titleize.gsub(" ", "/"))
    else
      @profession = Profession.find_by(name: @filter_param.titleize)
    end
    if Ingredient.rarities.keys.include?(@filter_param)
      @rarity = @filter_param
    else
      @rarity = nil
    end
    @season = Season.find_by(name: @filter_param.titleize)
    if Ingredient.categories.keys.include?(@filter_param)
      @type = @filter_param
    else
      @type = nil
    end
    if @profession
      @filter_type = :profession
      @components = IngredientProfession.where(profession: @profession).map(&:ingredient)
    elsif @rarity
      @filter_type = :rarity
      @components = Ingredient.where(rarity: @rarity)
    elsif @season
      @filter_type = :season
      @components = IngredientSeason.where(season: @season).map(&:ingredient)
    elsif @type
      @filter_type = :type
      @components = Ingredient.where(category: @type)
    else
      flash[:alert] = "Filter not found."
      redirect_to staff_components_path
    end
  end

end
