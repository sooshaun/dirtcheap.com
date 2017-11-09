class HouseholdItem < ApplicationRecord
  include ImageUploader::Attachment.new(:item_image)

  belongs_to :seller, class_name: 'User'
  # belongs_to :buyer, class_name: 'User'
  # validates_uniqueness_of :seller, :scope => :buyer
  has_many :reviews


  validates :year_purchase, presence: true, numericality: { only_integer: true, greater_than: 2011 }
  validates :description, :postcode, :street_name, :city, :state, :country, :genre, :title, presence: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters are the maximum allowed"}
  validates :price_cents, :transport_cost_cents, numericality: { greater_than_or_equal_to: 0 }


  geocoded_by :full_address   # from below def full_address method # can also be an IP address
  after_validation :geocode   # auto-fetch coordinates

  def country_name
      ISO3166::Country.new(country.upcase)  # this country_code is from database in the Model Country
  end

  def full_address
      "#{postcode} #{street_name}, #{city} #{state}, #{country_name.name}"  # name is from the countries code gem file
  end

  def location
    " #{city}, #{state}, #{country_name.name}"  # name is from the countries code gem file
  end



  # def full_address_2
  #     "#{postcode} #{street_address}, #{city} #{state}, #{country.name}"  # name is from the countries code gem file
  # end
 



end
