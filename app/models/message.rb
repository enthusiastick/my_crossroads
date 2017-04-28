class Message
  include ActiveModel::Model
  attr_accessor :body, :subject

  def send(sender_id, recipient_id)
    StaffMailer.contact_form(sender_id, recipient_id, subject, body).deliver_now
  end
end
