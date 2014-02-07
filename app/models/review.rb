class Review < ActiveRecord::Base
  validates_presence_of :user 
  validates_presence_of :market
  validates_presence_of :body 

  belongs_to :user, 
  inverse_of: :reviews 

  belongs_to :market,
  inverse_of: :reviews,
  dependent: :destroy

end

