class Staff::PicturesController < ApplicationController
  before_action :authenticate_staff!

  def index
    @components = Ingredient.where(archived: false).where.not(picture: nil).order(:name)
  end
end
