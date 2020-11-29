FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    introduce         { Faker::Lorem.sentence }
    category_id       { '2' }
    status_id         { '2' }
    shipping_id       { '2' }
    send_address_id   { '2' }
    day_id            { '2' }
    price             { Faker::Number.within(range: 300..9999999) }
    association :user
  end
end

