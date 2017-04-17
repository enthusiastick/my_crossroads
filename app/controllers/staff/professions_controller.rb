class Staff::ProfessionsController < ApplicationController
  before_action :authenticate_staff!

  def index
    @professions = Profession.order(:name)
  end

  def show
    @profession = Profession.find(params[:id])
  end
end
