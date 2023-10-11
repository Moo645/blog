# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# notebooks = Notebook.create([{ name: '美食筆記本' }, { name: '旅遊筆記本' }, { name: '景點筆記本' }])

# NoteCategory.create(name: '台灣小吃', notebook_id: notebooks.first.id)
# NoteCategory.create(name: '日式美食', notebook_id: notebooks.first.id)
# NoteCategory.create(name: '韓式美食', notebook_id: notebooks.first.id)
# NoteCategory.create(name: '咖啡廳', notebook_id: notebooks.first.id)
# NoteCategory.create(name: '甜點店', notebook_id: notebooks.first.id)

# NoteCategory.create(name: '台北', notebook_id: notebooks.second.id)
# NoteCategory.create(name: '台中', notebook_id: notebooks.second.id)
# NoteCategory.create(name: '台南', notebook_id: notebooks.second.id)
# NoteCategory.create(name: '嘉義', notebook_id: notebooks.second.id)

# NoteCategory.create(name: '人文', notebook_id: notebooks.last.id)
# NoteCategory.create(name: '自然', notebook_id: notebooks.last.id)
# NoteCategory.create(name: '遊樂園', notebook_id: notebooks.last.id)
# NoteCategory.create(name: '經典必去', notebook_id: notebooks.last.id)

notes_data = [
  { title: '美食之旅1', content: '今天去尝试了一家新的餐厅，食物非常美味。' },
  { title: '旅行日记1', content: '我刚刚回来自己的旅行，这是一个惊人的经验。' },
  { title: '城市探索1', content: '发现了一个隐藏的城市景点，这里非常有趣。' },
  { title: '美食之旅2', content: '今天去尝试了一家新的餐厅，食物非常美味。' },
  { title: '美食之旅3', content: '今天去尝试了一家新的餐厅，食物非常美味。' },
  { title: '旅行日记2', content: '我刚刚回来自己的旅行，这是一个惊人的经验。' },
  { title: '旅行日记3', content: '我刚刚回来自己的旅行，这是一个惊人的经验。' },
  { title: '城市探索2', content: '发现了一个隐藏的城市景点，这里非常有趣。' },
  { title: '城市探索3', content: '发现了一个隐藏的城市景点，这里非常有趣。' }
]

notes = Note.create(notes_data)

notebooks = Notebook.create([{ name: '美食筆記本' }, { name: '旅遊筆記本' }, { name: '景點筆記本' }])

categories_data = [
  [
    { name: '台灣小吃' },
    { name: '日式美食' },
    { name: '韓式美食' },
    { name: '咖啡廳' },
    { name: '甜點店' }
  ],
  [
    { name: '台北' },
    { name: '台中' },
    { name: '台南' },
    { name: '嘉義' }
  ],
  [
    { name: '人文' },
    { name: '自然' },
    { name: '遊樂園' },
    { name: '經典必去' }
  ]
]

notebooks.each_with_index do |notebook, index|
  notes[index].note_categories << notebook.note_categories.create(categories_data[index])
end

# 在笔记和笔记分类之间创建多对多关联

