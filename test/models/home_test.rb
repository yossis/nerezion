# == Schema Information
#
# Table name: homes
#
#  id                 :integer          not null, primary key
#  what_plan          :text
#  who_orgenize       :text
#  what_help          :text
#  what_need          :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email_registration :text
#

require 'test_helper'

class HomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
