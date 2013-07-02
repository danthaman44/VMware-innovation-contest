class PageItem < ActiveRecord::Base
  attr_accessible :user_id, :title, :content, :sort_order, :published

  #
  # Relations
  #

  # One-to-many relations
  belongs_to :page
  belongs_to :user


  #
  # Validations
  #

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :sort_order, allow_blank: true, numericality: { integer_only: true }

end
