class Market < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :datetime

  geocoded_by :address
after_validation :geocode, :if => :address_changed?







end
