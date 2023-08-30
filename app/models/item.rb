class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one_attached :image

  validates :image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price,
            presence: true
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { in: 300..9_999_999 }, only_integer:true
end
