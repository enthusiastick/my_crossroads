class ReceiptMailer < ApplicationMailer
  def registration_confirmation(receipt_id)
    @receipt = Receipt.find(receipt_id)
    @user = @receipt.user
    @events = @receipt.events
    mail to: "#{@user.full_name} <#{@user.email}>", subject: "Terres Rising Event Registration"
  end

  def registration_directors(receipt_id)
    @receipt = Receipt.find(receipt_id)
    @user = @receipt.user
    @events = @receipt.events
    @characters = @receipt.characters.uniq
    mail to: "Directors <directors@terresrising.com>", subject: "Terres Rising Event Registration", bcc: "Staff <staff@terresrising.com>"
  end
end
