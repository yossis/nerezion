# Preview all emails at http://localhost:3000/rails/mailers/system_mailer
class SystemMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/system_mailer/welcome
  def welcome
    SystemMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/system_mailer/contact
  def contact
    SystemMailer.contact
  end

  # Preview this email at http://localhost:3000/rails/mailers/system_mailer/created_book
  def created_book
    SystemMailer.created_book
  end

  # Preview this email at http://localhost:3000/rails/mailers/system_mailer/created_memorial
  def created_memorial
    SystemMailer.created_memorial
  end

  # Preview this email at http://localhost:3000/rails/mailers/system_mailer/destoryed_memorial
  def destoryed_memorial
    SystemMailer.destoryed_memorial
  end

end
