class AddTagsToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :tags, :string
  end
end
