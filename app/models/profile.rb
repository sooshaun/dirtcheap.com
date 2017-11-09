class Profile < ApplicationRecord

  include ImageUploader::Attachment.new(:avatar)

  belongs_to :user

  validates :first_name, :last_name, :mobile_number, presence: true 
 
  # validates :bsb, length: { is: 6 }, allow_blank: true
  # validates :bsb, format: { with: /\D/ , message: 'BSB needs to have number characters only' }
  # validates :mobile_number, uniqueness: true, presence: true, length: { is: 10 }

end
