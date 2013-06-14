class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :idea_id
      t.boolean :published

      t.timestamps
    end
  end
end
