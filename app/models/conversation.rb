class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  # belongs_to :user2, class_name: 'User'
  belongs_to :household_item

  has_many :messages, dependent: :destroy
  #validates_uniqueness_of :user1, :scope => :household_item

  scope :between, -> (user1_id, household_item_id) do
    where('(user1_id = ? AND household_item_id =?) OR (user1_id = ? AND household_item_id =?)', user1_id, household_item_id, household_item_id, user1_id)
  end


end
