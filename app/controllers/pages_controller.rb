class PagesController < ApplicationController
  before_action :authenticate_staff!, only: [:staff]

  def index
    @ashriyan_date = AshriyanDate.today
  end
end
