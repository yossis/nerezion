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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
