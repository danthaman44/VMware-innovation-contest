class CreatePageItems < ActiveRecord::Migration
  def change
    create_table :page_items do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :sort_order
      t.boolean :published

      t.timestamps
    end
  end
end
