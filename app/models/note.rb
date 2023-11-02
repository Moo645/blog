# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
  # relationships
  has_and_belongs_to_many :note_categories

  # vildiations
  validates_presence_of :title, message: "不能空白！"
end
