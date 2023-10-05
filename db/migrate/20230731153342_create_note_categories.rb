class CreateNoteCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :note_categories do |t|
      t.string :name
      t.references :notebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
