class CreateNoteCategoriesNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :note_categories_notes do |t|
      t.references :note_category, foreign_key: true
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
