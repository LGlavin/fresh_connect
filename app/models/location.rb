class Location < ActiveRecord::Base

geocoded_by :address

after_validation :geocode 
geocoded_by :address  #latitude  => :lat, :longitude => :lon 
# private

# def geocode_by_postal_code
#   self.latitude, self.longitude = PostalCode.new(postal_code).coordinates
# end
def address
  [street, city, state].compact.join(', ')
end

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}" 
  end
 end

