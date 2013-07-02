class Page < ActiveRecord::Base
  attr_accessible :user_id, :title, :published

  #
  # Relations
  #

  # One-to-many relations
  belongs_to :user
  has_many :page_items, dependent: :destroy


  #
  # Validations
  #

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  private

    def verify_destroy
      errors.add(:base, "Page items are using this page.") if page_items.present?
      errors.blank?
    end
end
