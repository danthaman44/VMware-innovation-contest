class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :job_title
      t.string :phone
      t.text :technical_expertise
      t.boolean :email_idea_comments, null: false, default: true
      t.boolean :email_news, null: false, default: true
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end

    add_index "users", ["name"]
    add_index "users", ["email"]
    add_index "users", ["job_title"]
    add_index "users", ["technical_expertise"]
  end
end
