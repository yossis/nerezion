# Preview all emails at http://localhost:3000/rails/mailers/pupil_mailer
class PupilMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pupil_mailer/welcome
  def welcome
    PupilMailer.welcome
  end

end
