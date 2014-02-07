class Recommendation < ActiveRecord::Base
    belongs_to :user,
    inverse_of: :recommendations
  belongs_to :market,
    inverse_of: :recommendations

  validates_presence_of :user
  validates_presence_of :market

  validates_uniqueness_of :market_id,
  scope: :user_id
end


