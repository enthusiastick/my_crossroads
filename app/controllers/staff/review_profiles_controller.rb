class Staff::ReviewProfilesController < ApplicationController
  before_action :authenticate_staff!

  def index
    @staff_profiles = StaffProfile.order(:series)
  end
end
