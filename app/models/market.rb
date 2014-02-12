class Market < ActiveRecord::Base 
  VALID_STATES = [
  "AL",
  "AK",
  "AZ",
  "AR",
  "CA",
  "CO",
  "CT",
  "DE",
  "FL",
  "GA",
  "HI",
  "ID",
  "IL",
  "IN",
  "IA",
  "KS",
  "KY",
  "LA",
  "ME",
  "MD",
  "MA",
  "MI",
  "MN",
  "MS",
  "MO",
  "MT",
  "NE",
  "NV",
  "NH",
  "NJ",
  "NM",
  "NY",
  "NC",
  "ND",
  "OH",
  "OK",
  "OR",
  "PA",
  "RI",
  "SC",
  "SD",
  "TN",
  "TX",
  "UT",
  "VT",
  "VA",
  "WA",
  "WV",
  "WI",
  "WY"
]



  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :postal_code
  validates_presence_of :state

  validates_inclusion_of :state,
    in: VALID_STATES
  
  
  validates_length_of :postal_code, is: 5

  
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


  # acts_as_gmappable :process_geocoding => false

# def gmaps4rails_address
# #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
#   "#{name}, #{address}" 
# end
end
