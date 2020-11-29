FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    introduce         { Faker::Lorem.sentence }
    category_id       { '2' }
    status_id         { '2' }
    shipping_id       { '2' }
    send_address_id   { '2' }
    day_id            { '2' }
    price             { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
