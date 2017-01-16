class PagesController < ApplicationController
  def index
    @ashriyan_date = AshriyanDate.today
  end
end
