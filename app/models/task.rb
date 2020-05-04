class Task < ApplicationRecord
  belongs_to :project
  validates_length_of :name, minimum: 10, maximum: 255
  validates_presence_of :project_id
end
