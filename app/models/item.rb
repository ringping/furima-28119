class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :memory
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

  validates :category_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :send_address_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
end
