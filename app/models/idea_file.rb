class IdeaFile < ActiveRecord::Base
  attr_accessible :idea_id, :user_id, :file, :published


  #
  # Relations
  #

  # One-to-many relations
  belongs_to :idea
  belongs_to :user


  #
  # Validations
  #

  validates :idea, :file, :user presence: true

end
