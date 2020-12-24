FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('test/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
    name { Faker::Lorem.word }
    price { Faker::Number.within(range: 300..9999999) }
    description { Faker::Lorem.sentence }
    category { Category.where.not(id: 0).sample }
    condition { Condition.where.not(id: 0).sample }
    shipping_fee_status { ShippingFeeStatus.where.not(id: 0).sample }
    shipping_prefecture { ShippingPrefecture.where.not(id: 0).sample }
    shipping_day { ShippingDay.where.not(id: 0).sample }
    user
  end
end