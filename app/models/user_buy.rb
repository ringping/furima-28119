class UserBuy
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :city_number, :phone_number, :building, :memory
  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :city_number  
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid."}
    validates :memory
  end

    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user = User.create(nickname: nickname)
    item = Item.create(name: name, image: image, price: price)  
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, city_number: city_number, building: building,phone_number: phone_number,user_id: user.id)
    Memory.create(item_id: item.id, user_id: user.id)
  end
end