# heads up! all your development data will be lost
User.destroy_all

user = User.create(name: 'Khaled Bhyan', email: 'kbhyan@gmail.com', password: 'kkk123')

100.times do
  # these tags will be shared with all notes
  tags = Faker::Lorem.words(number: 5)

  # keep some notes without tags for reliable testing
  with_tags = Faker::Boolean.boolean

  user.notes.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    tags: with_tags ? tags.sample(3) : []
  )
end