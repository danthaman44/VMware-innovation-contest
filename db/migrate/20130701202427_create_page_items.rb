class CreatePageItems < ActiveRecord::Migration
  def change
    create_table :page_items do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :content
      t.integer :sort_order, null: false, default: 10
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index "page_items", ["title"]
    add_index "page_items", ["sort_order"]
  end
end
