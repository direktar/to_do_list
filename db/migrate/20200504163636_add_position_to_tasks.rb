class AddPositionToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :position, :integer, default: 0
  end
end
