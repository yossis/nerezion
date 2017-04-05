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

class Memorial < ApplicationRecord
  validates :content, :pupil_id_reciver, presence: true
  belongs_to :pupil_sender, class_name: 'Pupil', foreign_key: :pupil_id_sender
  belongs_to :pupil_reciver, class_name: 'Pupil', foreign_key: :pupil_id_reciver
end
