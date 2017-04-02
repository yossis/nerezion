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

require 'test_helper'

class NotInListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
