class Profile < ApplicationRecord
  belongs_to :user


  validates :first_name. :last_name, : presence: true
  validates :boolean_field_name, inclusion: { in: [true, false] }
  validates :mobile_number, unique: true, presence: true

end
