# frozen_string_literal: true

Project.delete_all
Task.delete_all

p1 = Project.create!(name: 'Complete the test task for ruby Garage')
p2 = Project.create!(name: 'For Home')

# First profects tasks
Task.create!(
  name: 'Open this moke-up in Adobe Fireworks',
  project_id: p1.id
)
Task.create!(
  name: 'Alternative chek the file',
  project_id: p1.id
)
Task.create!(
  name: 'Write HTML & CSS',
  project_id: p1.id
)
Task.create!(
  name:
    'Add javascript to implement adding / editing / removing for todo itemns
    and lists taking into account as more use casses as possible ',
  project_id: p1.id
)

# Second profects tasks
Task.create!(
  name: 'Buy a milk',
  project_id: p2.id
)

Task.create!(
  name: 'Call Mam',
  project_id: p2.id
)

Task.create!(
  name: 'Clean the room',
  project_id: p2.id
)

Task.create!(
  name: 'Repair the DVD Player',
  project_id: p2.id
)
