class AddHourToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :hour, :integer
  end
end
