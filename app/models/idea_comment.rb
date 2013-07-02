class IdeaComment < ActiveRecord::Base
  attr_accessible :user_id, :idea_id, :content, :published

  #
  # Relations
  #

  # One-to-many relations
  belongs_to :idea
  belongs_to :user


  #
  # Validations
  #

  validates :content, presence: true

end
