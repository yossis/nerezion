class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_pupils

  def load_pupils
    @pupils = Pupil.where(is_registered: false)
  end
end
