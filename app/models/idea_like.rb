class IdeaLike < ActiveRecord::Base
  attr_accessible :idea_id, :user_id

  #
  # Relations
  #

  # One-to-many relations
  belongs_to :idea, :user


  #
  # Validations
  #

  validates :idea, presence: true
  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :idea_id }

end
