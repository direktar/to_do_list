class Task < ApplicationRecord
  belongs_to :project

  enum status: %i[complete uncomplete prioritize]
end
