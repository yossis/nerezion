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

  # def http_auth
  #   http_basic_authenticate_with name: "admin", password: "hunter2"
  # end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?
end
