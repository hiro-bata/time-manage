class RemoveTimeFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :time, :string
  end
end
