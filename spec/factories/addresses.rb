FactoryBot.define do
  factory :address do
    post_number             { '000-3232' }
    prefecture_id           { '2' }
    city                    { Faker::Address.city }
    city_number             { Faker::Address.zip }
    building                { Faker::Address.street_name }
    phone_number            { Faker::PhoneNumber.cell_phone }
    order_id                { '3' }
  end
end
