class PagesController < ApplicationController
  before_action :authenticate_staff!, only: [:staff_menu]

  def index
    @ashriyan_date = AshriyanDate.today
  end
end
