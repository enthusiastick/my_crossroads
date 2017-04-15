class Staff::BookingsController < ApplicationController
  before_action :authenticate_staff!

  def index
    @event = Event.find_by(slug: params[:event_id])
  end
end
