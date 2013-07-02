class CreateIdeaLikes < ActiveRecord::Migration
  def change
    create_table :idea_likes do |t|
      t.integer :user_id, null: false
      t.integer :idea_id, null: false

      t.timestamps
    end
  end
end
