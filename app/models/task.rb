class Task < ApplicationRecord
  belongs_to :project
  validates_length_of :name, minimum: 6, maximum: 255
  validates_presence_of :project_id
end
