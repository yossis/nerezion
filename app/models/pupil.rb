# == Schema Information
#
# Table name: pupils
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  madien_name   :string
#  class_name    :string
#  email         :string
#  phone         :string
#  is_coming     :boolean          default(FALSE)
#  is_registered :boolean          default(FALSE)
#  is_teacher    :boolean          default(FALSE)
#  is_invited    :boolean          default(FALSE)
#  invited_by    :integer
#  invited_phone :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pupil < ApplicationRecord
  # validates :phone, uniqueness: {message: 'מספר טלפון זה קיים במערכת'}, presence: {message: 'יש להכניס מספר טלפון'}
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  , message: 'כתובת מייל שגויה'}
  # validates :is_coming, acceptance: {message: 'נא לסמן הגעה'}
  default_scope { order(last_name: :asc) }

  has_one :book
  has_many :memorials_sender ,class_name: 'Memorial', foreign_key: :pupil_id_sender
  has_many :memorials_recived ,class_name: 'Memorial', foreign_key: :pupil_id_reciver



  def invited?
    is_invited || phone.present?
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def is_valid_phone?(str_number)
    if Phonelib.valid?(str_number)
      true
    else
      errors.add(:phone, 'מספר טלפון לא חוקי')
      false
    end
  end

  def book
    super || build_book
  end
end
