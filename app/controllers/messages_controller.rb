class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @staff = User.find_by(handle: params[:staff_id])
    authorize_contactable_staff(@staff)
    @message = Message.new(message_params)
    if !@message.body.present?
      flash[:alert] = "Message body cannot be blank."
      render :new
    elsif @message.send(current_user.id, @staff.id)
      flash[:success] = "Your message has been sent."
      redirect_to staff_index_path
    else
      flash[:alert] = "There was a problem sending your message."
      render :new
    end
  end

  def new
    @staff = User.find_by(handle: params[:staff_id])
    authorize_contactable_staff(@staff)
    @message = Message.new
  end

  def authorize_contactable_staff(user)
    unless user.staff? && user.staff_profile.present? && user.staff_profile.published?
      flash[:alert] = "Unable to locate staff member to contact."
      redirect_to staff_index_path
    end
  end

  protected

  def message_params
    params.require(:message).permit(:subject, :body)
  end
end
