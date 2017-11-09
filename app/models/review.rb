class Review < ApplicationRecord
  belongs_to :user
  belongs_to :household_item


  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6}
  validates :comment, length: { maximum: 500, too_long: "%{count} characters are the maximum allowed"}

end
