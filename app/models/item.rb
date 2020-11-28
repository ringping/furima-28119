class Item < ApplicationRecord
  belongs_to :user
  has_one    :memory
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :send_address
  belongs_to :shipping
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :introduce
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  validates :send_address_id, numericality: { other_than: 1 } 
  validates :shipping_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
end
