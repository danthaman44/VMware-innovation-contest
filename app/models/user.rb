class User < ActiveRecord::Base
  def attributes
    { name: :name, email: :email, password: :password, job_title: :job_title, phone: :phone,
      technical_expertise: :technical_expertise, email_idea_comments: :email_idea_comments,
      email_news: :email_news, is_admin: :is_admin,
      created_at: :created_at, updated_at: :updated_at }
  end

  attr_accessible :name, :email, :password, :job_title, :phone, :technical_expertise,
                  :email_idea_comments, :email_news, :is_admin

  #
  # Relations
  #

  # One-to-many relations
  has_many :ideas
  has_many :idea_files
  has_many :idea_likes
  has_many :idea_comments
  has_many :pages
  has_many :page_items
  has_many :posts

  # Many-to-many relations
  has_many :liked_ideas, through: :idea_likes, source: :idea
  has_many :commented_ideas, through: :idea_comments, source: :idea


  #
  # Validations
  #

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

end
