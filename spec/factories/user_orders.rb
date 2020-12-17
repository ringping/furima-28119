FactoryBot.define do
  factory :user_order do
    post_number { '000-3232' }
    prefecture_id           { '2' }
    city                    { Faker::Address.city }
    city_number             { Faker::Address.zip }
    building                { Faker::Address.street_name }
    phone_number            { '09012345678' }
    order_id                { '3' }
    token                   { 'tok_abcdefghijk00000000000000000' }
  end
end
