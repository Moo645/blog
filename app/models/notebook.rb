# == Schema Information
#
# Table name: notebooks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notebook < ApplicationRecord
  # relationships
  has_many :note_categories, dependent: :delete_all

  # validation
  validates_presence_of :name, message: "不能空白！"
  validates_uniqueness_of :name, message: "不能重複！"
end
