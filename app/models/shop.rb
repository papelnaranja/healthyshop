class Shop < ApplicationRecord
    enum state:[:draft, :published, :hidden]
    scope :published, -> { where(state: 1) }
    has_many :shop_tags ,  dependent: :destroy
    has_many :tags, through: :shop_tags
    #has_one_attached :photo


end
