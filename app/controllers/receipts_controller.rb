class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def create
    if valid_params?(params)
      events = Event.find(params[:receipt][:event_ids])
      charge = Stripe::Charge.create(
        amount: params[:amount].to_i,
        currency: "usd",
        source: params[:stripeToken],
        description: "Registration for #{events.pluck(:name).to_sentence}."
      )
      if charge.paid
        receipt = Receipt.new_from_charge(charge)
        receipt.ip_address = request.remote_ip
        receipt.user = current_user
        character = params[:receipt][:character_id].present? ? Character.find(params[:receipt][:character_id]) : nil
        bookings = Array.new
        events.each { |event| bookings << Booking.new(character: character, event: event, receipt: receipt, user: current_user) }
        if receipt.save && bookings.each(&:save)
          flash[:success] = "Your registration completed successfully."
          redirect_to events_path
        else
          binding.pry
        end
      else
        binding.pry
      end
    else
      flash[:alert] = "There was a problem with your registration. Your card has not been charged."
      redirect_to new_booking_path
    end
  end

  def valid_params?(params)
    params[:stripeToken].present? &&
    # params[:receipt][:street].present? &&
    # params[:receipt][:city].present? &&
    # params[:receipt][:state].present? &&
    # params[:receipt][:zip].present? &&
    params[:amount].to_i > 0
  end
end
