class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduce
    validates :image
  end

  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :category
  belongs_to :day
  belongs_to :send_address
  belongs_to :shipping
  belongs_to :status

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :day_id
    validates :send_address_id
    validates :shipping_id
    validates :status_id
  end
end
