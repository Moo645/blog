# == Schema Information
#
# Table name: note_categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  notebook_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class NoteCategory < ApplicationRecord
  # relationships
  belongs_to :notebook
  has_and_belongs_to_many :notes, -> { distinct }

  # validation
  validates_presence_of :name, message: "不能空白！"
end
