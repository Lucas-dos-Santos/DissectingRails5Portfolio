class CreateBlogsTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs_topics do |t|
      t.integer :blog_id, null: false, foreign_key: true
      t.integer :topic_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
