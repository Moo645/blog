class NoteCategory < ApplicationRecord
  # relationships
  belongs_to :notebook
  has_and_belongs_to_many :notes

  # validation
  validates_presence_of :name, message: "不能空白！"
end
