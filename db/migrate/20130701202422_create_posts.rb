class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index "posts", ["title"]
  end
end
