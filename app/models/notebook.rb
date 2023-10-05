class Notebook < ApplicationRecord
  # relationships
  has_many :note_categories, dependent: :delete_all

  # validation
  validates_presence_of :name, message: "不能空白！"
  validates_uniqueness_of :name, message: "不能重複！"
end
