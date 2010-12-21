class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :author_id
      t.integer :topic_id
      t.text :content
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
