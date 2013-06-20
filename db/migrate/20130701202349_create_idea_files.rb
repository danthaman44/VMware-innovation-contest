class CreateIdeaFiles < ActiveRecord::Migration
  def change
    create_table :idea_files do |t|
      t.integer :idea_id
      t.string :file
      t.boolean :published

      t.timestamps
    end
  end
end
