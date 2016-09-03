class CreateThreadPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :thread_posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :thread_id

      t.timestamps
    end
  end
end
