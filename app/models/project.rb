class Project < ApplicationRecord
  has_many :tasks, -> { order(status: :asc, position: :asc) }, dependent: :destroy

  validates_length_of :name, minimum: 6, maximum: 120
end
