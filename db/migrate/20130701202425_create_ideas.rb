class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index "ideas", ["title"]
    add_index "ideas", ["user_id"]
  end
end
