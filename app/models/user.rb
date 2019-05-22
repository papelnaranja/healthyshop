class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role:[:admin, :shopper, :client]
  has_one_attached :avatar
  def self.sizes
    {
      avatar: { resize: "50x50" },
      hero1:     { resize: "1000x500" }
    }
  end

  def sized(size)
    self.avatar.variant(User.sizes[size]).processed
  end

end
