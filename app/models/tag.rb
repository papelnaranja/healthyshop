class Tag < ApplicationRecord
    has_many :shop_tags
    has_many :shops, through: :shop_tags
end
