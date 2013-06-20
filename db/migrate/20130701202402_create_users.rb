class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :job_title
      t.string :phone
      t.text :technical_expertise
      t.boolean :email_idea_comments
      t.boolean :email_news
      t.boolean :is_admin

      t.timestamps
    end
  end
end
