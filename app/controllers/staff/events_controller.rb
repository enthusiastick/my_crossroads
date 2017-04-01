class Staff::EventsController < ApplicationController
  before_action :authenticate_staff!

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event created successfully."
      redirect_to events_path
    else
      flash.now[:alert] = "There was a problem creating your event."
      render :new
    end
  end

  def new
    @event = Event.new
  end

  protected

  def event_params
    params.require(:event).permit(:address, :description, :end_date, :latitude, :longitude, :name, :start_date)
  end
end
