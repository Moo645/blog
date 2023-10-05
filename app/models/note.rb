class Note < ApplicationRecord
  # relationships
  has_and_belongs_to_many :note_categories

  # vildiations
  validates_presence_of :title, message: "不能空白！"
end
