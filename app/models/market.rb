class Market < ActiveRecord::Base 
  
  validates_presence_of :address
  
  has_many :reviews,
  {
    inverse_of: :market,
    dependent: :destroy
  }

  belongs_to :user,
  {
    inverse_of: :markets
  }
   has_many :recommendations,
    inverse_of: :market

  def self.search(search)
    where("address like ?", "%#{search}%")
  end

def address
  [city, state].compact.join(', ')
end


  geocoded_by :address
after_validation :geocode, :if => :address_changed?


  acts_as_gmappable :process_geocoding => false

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{name}, #{address}" 
end
end
