class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_condition
  belongs_to :category
  belongs_to :shipping_fee_payer
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :image, :price, :item_name, :description, presence: true
  validates :category_id, :item_condition_id, :shipping_fee_payer_id, :prefecture_id, :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
