class Staff::ProfessionLinksController < ApplicationController
  before_action :authenticate_staff_editor!

  def create
    @profession_link = ProfessionLink.new(staff_profession_link_params)
    if @profession_link.save
      flash[:success] = "Profession link created succesfully."
      redirect_to staff_profession_path(@profession_link.profession)
    else
      flash.now[:alert] = "There was a problem creating your profession link."
      @professions = Profession.order(:name)
      render :new
    end
  end

  def new
    @profession_link = ProfessionLink.new
    @professions = Profession.order(:name)
  end

  def update
    @profession_link = ProfessionLink.find(params[:id])
    if @profession_link.update(staff_profession_link_params)
      flash[:success] = "Profession link updated succesfully."
    else
      flash[:alert] = "There was a problem updating your profession link."
    end
    redirect_to staff_profession_path(@profession_link.profession)
  end

  protected

  def staff_profession_link_params
    params.require(:profession_link).permit(:profession_id, :name, :url)
  end
end
