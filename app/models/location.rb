class Location < ActiveRecord::Base

geocoded_by :address

after_validation :geocode 

# private

# def geocode_by_postal_code
#   self.latitude, self.longitude = PostalCode.new(postal_code).coordinates
# end

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.state}" 
  end
    def gmaps4rails_infowindow
         "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
   end
 end

