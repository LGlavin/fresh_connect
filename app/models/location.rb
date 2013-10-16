class Location < ActiveRecord::Base
geocoded_by :address
after_validation :geocode, :if => :address_changed?

# private

# def geocode_by_postal_code
#   self.latitude, self.longitude = PostalCode.new(postal_code).coordinates
# # end
# def address
#   [street, city, state].compact.join(', ')
# end

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{address}"
  end
 end


