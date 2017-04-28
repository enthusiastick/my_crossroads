class Staff::StaffProfilesController < ApplicationController
  before_action :authenticate_staff!

  def create
    @staff_profile = StaffProfile.new(staff_profile_params)
    if @staff_profile.save
      flash[:success] = "Staff profile updated successfully."
      redirect_to staff_profiles_path
    else
      flash[:alert] = "There was a problem updating your staff profile."
      render "staff/profiles/index"
    end
  end

  def update
    @staff_profile = StaffProfile.find(params[:id])
    if @staff_profile.update(staff_profile_params)
      flash[:success] = "Staff profile updated successfully."
      redirect_to staff_profiles_path
    else
      flash[:alert] = "There was a problem updating your staff profile."
      render "staff/profiles/index"
    end
  end

  protected

  def staff_profile_params
    params.require(:staff_profile).permit(:picture, :title, :responsibilities, :blurb).merge(user: current_user)
  end
end
