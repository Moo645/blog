class NoteCategory < ApplicationRecord
  # relationships
  belongs_to :notebook
  has_and_belongs_to_many :notes
end
