class ContactMailer < ApplicationMailer
  
  def send_mail(contact)
    @contact = contact
    mail to: ENV['GMAIL'], subject: 'お問い合わせを承りました'
  end
  
end
