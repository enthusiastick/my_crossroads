class ReceiptMailer < ApplicationMailer
  def registration_confirmation(receipt_id)
    @receipt = Receipt.find(receipt_id)
    @user = @receipt.user
    @events = @receipt.events
    mail to: "#{@user.full_name} <#{@user.email}>", subject: "Terres Rising Event Registration"
  end
end
