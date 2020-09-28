class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :name, presence: true, length: { minimum: 6, maximum: 255 }
  validates_presence_of :project_id
  acts_as_list # check!!
end
