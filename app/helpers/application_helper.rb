module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def nl2br(s)
    s.gsub(/\n/, '<br>').html_safe
  end

  def name_with_invite(pupil)
    if pupil.invited?
      "#{pupil.first_name} #{pupil.last_name} (נשלחה הזמנה)"
    else
      str = "<a class=modal-popup data-target=#modalInvite data-uid=#{pupil.id}>#{pupil.first_name} #{pupil.last_name}</a>"
      str.html_safe

    end
  end
end
