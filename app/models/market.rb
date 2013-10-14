class Market < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :datetime
  validates_presence_of :city
  validates_presence_of :postal_code
  validates_presence_of :state

  geocoded_by :address
after_validation :geocode, :if => :address_changed?
end
