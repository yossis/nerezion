# == Schema Information
#
# Table name: memorials
#
#  id               :integer          not null, primary key
#  book_id          :integer
#  pupil_id_sender  :integer
#  pupil_id_reciver :integer
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class MemorialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
