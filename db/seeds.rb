# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Create some ideas
["Fusion", "Player", "Workstation"].each do |t|
  new_idea = Idea.find_or_create_by(title: t)
  new_idea.published = true
  new_idea.description = "This is a sample idea"
  new_idea.user_id = 1
  new_idea.save
end