class Idea < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :published

  #
  # Relations
  #

  # One-to-many relations
  belongs_to :user
  has_many :idea_likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :idea_files, dependent: :destroy

  # Many-to-many relations
  has_many :likers, through: :idea_likes, source: :user
  has_many :commenters, through: :idea_comments, source: :user


  #
  # Validations
  #

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :user, presence: true
  validates :description, presence: true

end
