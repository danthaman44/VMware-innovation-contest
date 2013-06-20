class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :idea_id
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
