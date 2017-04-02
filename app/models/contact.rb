# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  full_name    :string
#  email        :string
#  phone_number :string
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Contact < ApplicationRecord
  validates :full_name, presence: {message: 'נא להכניס שם מלא'}
  validates :phone_number, presence: {message: 'יש להכניס מספר טלפון'}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  , message: 'כתובת מייל שגויה'}
  validates :body, presence: {message: 'נא להכניס תוכן'}
end
