class Location < ActiveRecord::Base

geocoded_by :address

after_validation :gecode_by_postal_code, if: :postal_code

protected 

def geocode_by_postal_code
  self.latitude, self.longitude = PostalCode.new(postal_code).coordinates
  end
end
