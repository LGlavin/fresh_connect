class Market < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :datetime

  geocoded_by :address
after_validation :geocode, :if => :address_changed?


acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.street}, #{self.city}, #{self.country}" 
end


end
