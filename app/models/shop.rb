class Shop < ApplicationRecord
    enum state:[:draft, :published, :hidden]
    scope :published, -> { where(state: 1) }
    has_one_attached :photo
    has_many :shop_tags
    has_many :tags, through: :shop_tags
end
