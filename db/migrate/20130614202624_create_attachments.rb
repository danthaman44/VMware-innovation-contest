class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.text :location
      t.integer :file_size
      t.integer :idea_id
      t.boolean :published

      t.timestamps
    end
  end
end
