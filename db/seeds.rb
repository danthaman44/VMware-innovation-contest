# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Users

["Dexter Arver", "Geoff Mayes", "Danny Walcoff", "Dan Deng"].each do |name|
  user = User.find_or_create_by(name: name)
  user.name = name
  user.email = "worker@vmware.com"
  user.password = "password"
  user.job_title = "VMware employee"
  user.technical_expertise = "Coding"
  user.is_admin = true
  user.save
end

#
# TODO (once associations are created)
#

#[{ name: "Dexter Arver",
#   email: "darver@vmware.com",
#   password: "pw",
#   job_title: "VMware Employee",
#   technical_expertise: "coding",
#   phone: "18005556666",
#   is_admin: true },
# { name: "Geoff Mayes",
#   email: "mayesg@vmware.com",
#   password: "pw",
#   job_title: "VMware Employee",
#   technical_expertise: "coding",
#   phone: "18005556666",
#   is_admin: true },
# { name: "Danny Walcoff",
#   email: "dwalcoff@vmware.com",
#   password: "pw",
#   job_title: "VMware Employee",
#   technical_expertise: "designing",
#   phone: "18005556666",
#   is_admin: true },
# { name: "Dana Nourie",
#   email: "dnourie@vmware.com",
#   password: "pw",
#   job_title: "VMware Employee",
#   technical_expertise: "engaging",
#   phone: "18005556666",
#   is_admin: true },
# { name: "Sean Borman",
#   email: "sborman@vmware.com",
#   password: "pw",
#   job_title: "VMware Employee",
#   technical_expertise: "business",
#   phone: "18005556666",
#   is_admin: true }].each do |user|
#     User.create(user)
#   end


# Ideas

["Fusion", "Workstation", "Player"].each do |title|
  idea = Idea.find_or_create_by(title: title)
  idea.title = title
  idea.user_id = 1
  idea.description = "This is a sample idea"
  idea.published = true
  idea.save
end

#
# TODO (once associations are created)
#

#  [{ user_id: 1,
#     name: "Fusion",
#     description: "This is a sample idea",
#     published: true },
#   { user_id: 1,
#     name: "Player",
#     description: "This is a sample idea",
#     published: true },
#   { user_id: 1,
#     name: "Workstation",
#     description: "This is a sample idea",
#     published: true }].each do |idea|
#       Idea.create(idea)
#     end