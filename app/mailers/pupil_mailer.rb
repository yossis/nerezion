class PupilMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pupil_mailer.welcome.subject
  #
  def welcome(pupil_id)
    @pupil = Pupil.find pupil_id
    @home = Home.first
    mail to: @pupil.email, subject: 'כנס מחזור ל בית הספר נר-עציון'
  end
end
