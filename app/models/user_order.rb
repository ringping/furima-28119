class UserOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :city_number, :phone_number, :building, :order_id, :token, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :city_number
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid.' }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, city_number: city_number,
                   phone_number: phone_number, building: building, order_id: order.id)
  end
end
