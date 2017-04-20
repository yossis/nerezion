# == Schema Information
#
# Table name: not_in_lists
#
#  id           :integer          not null, primary key
#  full_name    :string
#  phone_number :string
#  email        :string
#  class_name   :string
#  is_teacher   :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class NotInList < ApplicationRecord
  validates :full_name, presence: true
  validates :phone_number, uniqueness: {message: 'מספר טלפון זה קיים במערכת'}, presence: {message: 'יש להכניס מספר טלפון'}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  , message: 'כתובת מייל שגויה'}, :allow_blank => true


  def is_valid_phone?(str_number)
    if Phonelib.valid?(str_number)
      true
    else
      errors.add(:phone_number, 'מספר טלפון לא חוקי')
      false
    end
  end
end
