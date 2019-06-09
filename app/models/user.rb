class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]
  enum role:[:admin, :shopper, :client]
  #has_one_attached :avatar
 
  def self.from_omniauth(auth)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  # geocoded_by :address
  # after_validation :geocode
  def self.sizes
    {
      avatar: { resize: "50x50" }    
    }
  end

  def sized(size)
    self.avatar.variant(User.sizes[size]).processed
  end


end
