require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :load_pupils

  def load_pupils
    @pupils = Pupil.where(is_registered: false)
  end

  def current_user
    @current_user ||= Pupil.find(cookies.signed[:pupil]) if cookies.signed[:pupil]
  end
  helper_method :current_user
end
