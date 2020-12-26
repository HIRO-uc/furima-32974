class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_prefecture_id, :city, :house_number, :building_name, :tel, :token, :item_id, :user_id

  validates :token, presence: true
  with_options presence: true do
    validates :postal_code,                format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
  end
  validates :shipping_prefecture_id, numericality: { other_than: 0, message: 'Select' }
  validates :city, :house_number, presence: true
  with_options presence: true do
    validates :tel,                        format: { with: /\A\d{10,11}\z/, message: 'Input only half-width number' }
  end

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city,
                   house_number: house_number, building_name: building_name, tel: tel)
  end
end
