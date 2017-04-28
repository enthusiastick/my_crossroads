class StaffMailer < ApplicationMailer
  def contact_form(sender_id, recipient_id, subject, body)
    @body = body
    recipient = User.find(recipient_id)
    sender = User.find(sender_id)
    subject = subject.empty? ? "[MyCrossroads] New Message" : "[MyCrossroads] #{subject}"
    mail to: "#{recipient.full_name} <#{recipient.email}>", subject: subject, reply_to: "#{sender.full_name} <#{sender.email}>"
  end
end
