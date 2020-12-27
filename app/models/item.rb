class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :shipping_prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :purchase

  validates :image, :name, :description, :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Harf-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of Setting range' }
  validates :category_id, :condition_id, :shipping_fee_status_id, :shipping_prefecture_id, :shipping_day_id,
            numericality: { other_than: 0, message: 'Select' }
end
