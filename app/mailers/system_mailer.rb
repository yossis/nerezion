class SystemMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.welcome.subject
  #
  def welcome(pupil)
    @pupil = pupil
    mail to: "yossishalem@gmail.com", subject: 'NerEzion - New User Registration'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.contact.subject
  #
  def contact(contact)
    @contact = contact
    mail to: "yossishalem@gmail.com", subject: 'NerEzion - You have a new message(contact)'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.created_book.subject
  #
  def created_book(book)
    @book = book
    mail to: "yossishalem@gmail.com", subject: 'NerEzion - new book created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.created_memorial.subject
  #
  def created_memorial(memorial)
    @memorial = memorial
    mail to: "yossishalem@gmail.com", subject: 'NerEzion - new memorial'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.destoryed_memorial.subject
  #
  def destoryed_memorial(memorial_id)
    mail to: "yossishalem@gmail.com", subject: "NerEzion: memorial #{memorial_id} is removed!"
  end
end
