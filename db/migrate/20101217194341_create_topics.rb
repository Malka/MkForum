class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :author_id
      t.integer :forum_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
