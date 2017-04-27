class Staff::BioController < ApplicationController
  before_action :authenticate_staff!

  def index
    if current_user.staff_profile.present?
      @staff_profile = current_user.staff_profile
    else
      @staff_profile = StaffProfile.new
    end
  end
end
