class EventsController < ApplicationController
  def index
    @events = Event.where(visible: true).where("end_date > ?", Time.now).order(:start_date)
  end

  def show
    @event = Event.find_by(slug: params[:id])
    @booking = Booking.find_by(event: @event, user: current_user)
    @characters = @event.bookings.where.not(character: nil).map(&:character).pluck(:name)
    @markdown = new_markdown
    unless @event.present? && @event.visible?
      flash[:alert] = "Event not found."
      redirect_to events_path
    end
  end
end
