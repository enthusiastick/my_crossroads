class Staff::ReviewProfilesController < ApplicationController
  before_action :authenticate_staff_editor!

  def index
    @staff_profiles = StaffProfile.order(:series)
  end
end
