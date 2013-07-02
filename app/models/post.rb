class Post < ActiveRecord::Base
  attr_accessible :user_id, :title, :content, :published

  #
  # Relations
  #

  # One-to-many relations
  belongs_to :user


  #
  # Validations
  #

  validates :title, :content, presence: true
  validates :title, uniqueness: { case_sensitive: false }

end
