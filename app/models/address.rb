class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_prefecture

  validates :postal_code, :city, :house_number, :tel, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :tel,         format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
  validates :shipping_prefecture_id, numericality: { other_than: 0, message: 'Select' }
end
