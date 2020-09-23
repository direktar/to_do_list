class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(status: :asc, position: :asc) }, dependent: :destroy

  validates :name, presence: true, length: { minimum: 6, maximum: 120 }
end
