class UserOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :city_number, :phone_number, :building, :order
  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :city_number  
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid."}
    validates :order
  end

    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end

  def save
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, city_number: city_number, building: building,phone_number: phone_number)
    Order.create(item_id: item_id, user_id: user_id)
  end
end