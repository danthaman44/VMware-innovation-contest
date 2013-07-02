class CreateIdeaComments < ActiveRecord::Migration
  def change
    create_table :idea_comments do |t|
      t.integer :user_id, null: false
      t.integer :idea_id, null: false
      t.text :content, null: false
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index "idea_comments", ["user_id"]
    add_index "idea_comments", ["idea_id"]
  end
end
