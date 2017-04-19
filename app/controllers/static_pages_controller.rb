class StaticPagesController < ApplicationController
  def home
    @home = Home.find(1)
    @home_bold = 'class=bold'
    if mobile_device?
      @mb0 = "mb0"
    else
      @transparent = 'sticky transparent'
    end
  end

  def registration
    @pupils = Pupil.all
    @registration_bold = 'class=bold'
    @pupil = Pupil.new
  end

  def login
    @pupil = Pupil.find_by(phone: params[:invited_phone])
    if @pupil.present?
      cookies.signed[:pupil] = { value: @pupil.id, expires: 1.year.from_now }
    end
  end

  def whos_in
    @who_comes_bold = 'class=bold'
    @who_comes1 = Pupil.where(is_coming: true, class_name: '1', is_teacher: false)
    @who_comes2 = Pupil.where(is_coming: true, class_name: '2', is_teacher: false)
    @who_comes3 = Pupil.where(is_coming: true, class_name: '3', is_teacher: false)
    @teachers = Pupil.where(is_coming: true, is_teacher: true)

    @no_details1 = Pupil.where(email: nil, phone: nil, class_name: '1').all
    @no_details2 = Pupil.where(email: nil, phone: nil, class_name: '2')
    @no_details3 = Pupil.where(email: nil, phone: nil, class_name: '3')

  end

  def book_memorials
    @book = current_user.present? ? current_user.book : Book.new
    @pupils = Pupil.all
    current_user.association(:memorials_sender).add_to_target(Memorial.new) if current_user.present?

  end
end
