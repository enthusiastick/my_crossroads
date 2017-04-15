class Staff::EventsController < ApplicationController
  before_action :authenticate_staff_editor!

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event created successfully."
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "There was a problem creating your event."
      render :new
    end
  end

  def destroy
    @event = Event.find_by(slug: params[:id])
    if @event.update(visible: false)
      flash[:success] = "Event deleted successfully."
      redirect_to events_path
    else
      flash.now[:alert] = "There was a problem deleting your event."
      render :edit
    end
  end

  def edit
    @event = Event.find_by(slug: params[:id])
  end

  def new
    @event = Event.new
  end

  def update
    @event = Event.find_by(slug: params[:id])
    if @event.update(event_params)
      @event.regenerate_slug!
      flash[:success] = "Event updated successfully."
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "There was a problem updating your event."
      render :edit
    end
  end

  protected

  def event_params
    params.require(:event).permit(:address, :directions, :end_date, :latitude, :longitude, :name, :start_date)
  end
end
