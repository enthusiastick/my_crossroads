class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @receipt = Receipt.new(phone: current_user.phone, street: current_user.street_address, city: current_user.city, state: current_user.state, zip: current_user.zip, report: current_user.self_report)
    @events = Event.where(visible: true).where("end_date > ?", Time.now).order(:start_date)
    @stripe_publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]
  end
end
