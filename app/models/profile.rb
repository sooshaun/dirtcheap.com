class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, presence: true
  validates :privacy, inclusion: { in: [true, false] }
  validates :bsb, length: { is: 6 }
  validates :mobile_number, uniqueness: true, presence: true, length: { is: 10 }

end
