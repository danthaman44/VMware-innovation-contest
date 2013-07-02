# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

  # Users

 [{ name: "Dexter Arver",
    email: "darver@vmware.com",
    password: "password",
    job_title: "VMware Employee",
    technical_expertise: "coding",
    phone: "18005556666",
    is_admin: true },
  { name: "Geoff Mayes",
    email: "mayesg@vmware.com",
    password: "password",
    job_title: "VMware Employee",
    technical_expertise: "coding",
    phone: "18005557777",
    is_admin: true },
  { name: "Danny Walcoff",
    email: "dwalcoff@vmware.com",
    password: "password",
    job_title: "VMware Employee",
    technical_expertise: "designing",
    phone: "18005558888",
    is_admin: true },
  { name: "Dana Nourie",
    email: "dnourie@vmware.com",
    password: "password",
    job_title: "VMware Employee",
    technical_expertise: "engaging",
    phone: "18005559999",
    is_admin: true },
  { name: "Sean Borman",
    email: "sborman@vmware.com",
    password: "password",
    job_title: "VMware Employee",
    technical_expertise: "business",
    phone: "18005550000",
    is_admin: true }].each do |user|
      User.create(user)
    end


  # Ideas

 [{ user_id: 1,
    title: "Fusion",
    description: "This is a sample idea",
    published: true },
  { user_id: 1,
    title: "Player",
    description: "This is a sample idea",
    published: true },
  { user_id: 1,
    title: "Workstation",
    description: "This is a sample idea",
    published: true }].each do |idea|
      Idea.create(idea)
    end