class CashBookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    if valid_params?(params)
      events = Event.find(params[:receipt][:event_ids])
      receipt = Receipt.new
      receipt.ip_address = request.remote_ip
      receipt.user = current_user
      receipt.amount = 0
      character = params[:receipt][:character_id].present? ? Character.find(params[:receipt][:character_id]) : nil
      bookings = Array.new
      events.each { |event| bookings << Booking.new(character: character, event: event, receipt: receipt, user: current_user) }
      user = current_user
      user.assign_attributes_from_receipt(params[:receipt])
      if receipt.save && user.save && bookings.each(&:save)
        receipt.send_confirmation_email
        flash[:success] = "Your registration completed successfully."
        redirect_to events_path
      else
        flash[:alert] = "There was a problem with your registration."
        redirect_to new_cash_booking_path
      end
    else
      flash[:alert] = "There was a problem with your registration."
      redirect_to new_cash_booking_path
    end
  end

  def new
    @receipt = Receipt.new(phone: current_user.phone, street: current_user.street_address, city: current_user.city, state: current_user.state, zip: current_user.zip, report: current_user.self_report)
    @events = Event.where(visible: true).where("end_date > ?", Time.now).order(:start_date)
  end

  def valid_params?(params)
    params[:receipt][:street].present? &&
    params[:receipt][:city].present? &&
    params[:receipt][:state].present? &&
    params[:receipt][:zip].present? &&
    params[:receipt][:event_ids].present?
  end
end
