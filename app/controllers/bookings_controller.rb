class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @receipt = Receipt.new(phone: current_user.phone, street: current_user.street_address, city: current_user.city, state: current_user.state, zip: current_user.zip, report: current_user.self_report)
    @events = Event.where(visible: true).where("end_date > ?", Time.now).order(:start_date) - current_user.events
    @stripe_publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]
  end

  def update
    @booking = Booking.find(params[:id])
    authorize_record_owner(@booking.user)
    if @booking.update(booking_params)
      flash[:success] = "Your registration updated successfully."
    else
      flash[:alert] = "There was a problem updating your registration."
    end
    redirect_to event_path(@booking.event)
  end

  private

  def booking_params
    params.require(:booking).permit(:character_id)
  end
end
