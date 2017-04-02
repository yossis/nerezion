class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_us.subject
  #
  def contact_us(contact)
    @contact = contact
    mail from: @contact.email, to: 'yossishalem@gmail.com', subject: 'כנס מחזור - הודעה מהאתר'
  end
end
