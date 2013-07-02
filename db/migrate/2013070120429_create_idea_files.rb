class CreateIdeaFiles < ActiveRecord::Migration
  def change
    create_table :idea_files do |t|
      t.integer :idea_id, null: false
      t.integer :user_id, null: false
      t.string :file, null: false
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index "idea_files", ["idea_id"]
    add_index "idea_files", ["file"]
  end
end
