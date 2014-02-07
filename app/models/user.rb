class User < ActiveRecord::Base

  validates_presence_of :username
  validates :username, length: { maximum: 30 }
   validates_presence_of :first_name
  validates_presence_of :last_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :reviews, inverse_of: :user
  has_many :markets, inverse_of: :user 
  has_many :recommendations, inverse_of: :user
  
    def full_name
    "#{first_name} #{last_name}"
  end


end
