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

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
