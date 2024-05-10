class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_condition, :category, :shipping_fee_payer, :prefecture, :days_to_ship

  validates :image, :item_name, :description presence: true
  validates :category_id, :item_condition_id, :shipping_fee_payer_id, 
            :prefecture_id, :days_to_ship_id  numericality: { other_than: 1 } 
end

end
