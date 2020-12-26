FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567'}
    shipping_prefecture_id { 1 } 
    city { '新宿区' }
    house_number { '新町1-1-1' }
    building_name { 'コーポ新宿101' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end