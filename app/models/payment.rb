class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :household_item
end
