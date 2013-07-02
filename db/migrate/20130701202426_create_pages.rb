class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :content
      t.integer :sort_order, null: false, default: 10
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index "pages", ["title"]
  end
end
