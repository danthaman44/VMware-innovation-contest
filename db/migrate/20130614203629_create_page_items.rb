class CreatePageItems < ActiveRecord::Migration
  def change
    create_table :page_items do |t|
      t.integer :order
      t.text :content
      t.boolean :published
      t.integer :user_id

      t.timestamps
    end
  end
end
