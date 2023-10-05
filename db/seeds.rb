# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

notebooks = Notebook.create([{ name: '美食筆記本' }, { name: '旅遊筆記本' }, { name: '景點筆記本' }])

NoteCategory.create(name: '台灣小吃', notebook_id: notebooks.first.id)
NoteCategory.create(name: '日式美食', notebook_id: notebooks.first.id)
NoteCategory.create(name: '韓式美食', notebook_id: notebooks.first.id)
NoteCategory.create(name: '咖啡廳', notebook_id: notebooks.first.id)
NoteCategory.create(name: '甜點店', notebook_id: notebooks.first.id)

NoteCategory.create(name: '台北', notebook_id: notebooks.second.id)
NoteCategory.create(name: '台中', notebook_id: notebooks.second.id)
NoteCategory.create(name: '台南', notebook_id: notebooks.second.id)
NoteCategory.create(name: '嘉義', notebook_id: notebooks.second.id)

NoteCategory.create(name: '人文', notebook_id: notebooks.last.id)
NoteCategory.create(name: '自然', notebook_id: notebooks.last.id)
NoteCategory.create(name: '遊樂園', notebook_id: notebooks.last.id)
NoteCategory.create(name: '經典必去', notebook_id: notebooks.last.id)
