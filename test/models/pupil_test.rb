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

require 'test_helper'

class PupilTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
