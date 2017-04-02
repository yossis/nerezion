class StaticPagesController < ApplicationController
  def home
    @home = Home.find(1)
    @home_bold = 'class=bold'
    @transparent = 'sticky transparent'
  end

  def registration
    @pupils = Pupil.all
    @registration_bold = 'class=bold'
    @pupil = Pupil.new
  end

  def login
    #code
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
end
