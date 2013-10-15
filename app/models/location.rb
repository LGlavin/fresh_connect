class Location < ActiveRecord::Base

geocoded_by :address

after_validation :gecode_by_postal_code, if: :postal_code?

private

def geocode_by_postal_code
  self.latitude, self.longitude = PostalCode.new(postal_code).coordinates
end

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}" 
  end
 end
end
