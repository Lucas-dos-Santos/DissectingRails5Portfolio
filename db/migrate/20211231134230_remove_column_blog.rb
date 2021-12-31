class RemoveColumnBlog < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :topic_id
  end
end
