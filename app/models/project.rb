class Project < ApplicationRecord
  has_many :tasks

  validates_length_of :name, minimum: 6, maximum: 120
end
