class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string     :name, limit: 255, null: false
      t.boolean    :status, default: false
      t.string     :deadline
      t.references :project, index: true


      t.timestamps
    end
  end
end
