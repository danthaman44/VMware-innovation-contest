class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :job_title
      t.integer :phone
      t.string :expertise
      t.boolean :email_notification_comment
      t.boolean :email_notification_news
      t.boolean :is_admin

      t.timestamps
    end
  end
end
