class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @receipt = Receipt.new
    @events = Event.where(visible: true).where("end_date > ?", Time.now).order(:start_date)
    @stripe_publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]
  end
end
