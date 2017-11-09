class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile
  has_many :household_items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 4 }

  validate :password_complexity
  
  # 
  def password_complexity
      if password.present?
        if !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\W)/) 
            errors.add :password, "Password must contain at least one uppercase, lowercase and symbol requirements"
      end
    end
  end

end
