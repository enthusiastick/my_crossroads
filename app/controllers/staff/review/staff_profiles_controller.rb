class Staff::Review::StaffProfilesController < ApplicationController
  before_action :authenticate_staff_editor!

  def update
    @staff_profile = StaffProfile.find(params[:id])
    if @staff_profile.update(staff_profile_review_params)
      flash[:success] = "Staff bio updated successfully."
      redirect_to staff_review_bios_path
    else
      flash[:alert] = "There was a problem updating staff bio for #{@staff_profile.user.full_name}."
      @staff_profiles = StaffProfile.order(:series)
      render "staff/review_bios/index"
    end
  end

  protected

  def staff_profile_review_params
    params.require(:staff_profile).permit(:series, :published)
  end
end
