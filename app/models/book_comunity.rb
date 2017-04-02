# == Schema Information
#
# Table name: book_comunities
#
#  id               :integer          not null, primary key
#  pupil_id         :integer
#  about_me         :text
#  photo_from_last  :string
#  photo_form_today :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class BookComunity < ApplicationRecord
end
