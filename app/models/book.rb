# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  pupil_id     :integer
#  last_name    :string
#  about        :text
#  expose_phone :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ApplicationRecord
  has_attachment  :old_avatar, accept: [:jpg, :png, :gif]
  has_attachment  :new_avatar, accept: [:jpg, :png, :gif]
	has_attachments :photos, maximum: 10

  belongs_to :pupil
  has_many :memorials
end
