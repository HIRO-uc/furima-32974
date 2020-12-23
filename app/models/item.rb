class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :shipping_prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :image, :name, :description, presence: true
  validates :category_id, :condition_id, :shipping_fee_status_id, :shipping_prefecture_id, :shipping_day_id, numericality: { other_than: 0 }
end
