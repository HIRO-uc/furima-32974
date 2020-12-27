class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_prefecture_id, :city, :house_number, :building_name, :tel, :token, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'Input only half-width number' }
  end

  validates :shipping_prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city,
                   house_number: house_number, building_name: building_name, tel: tel)
  end
end
