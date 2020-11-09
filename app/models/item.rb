class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :day
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :status
  has_one_attached :image
  has_one :purchase
  belongs_to :user
  has_one :user_buy
  
  with_options presence: true do
    validates :description
    validates :category_id
    validates :item_name
    validates :status_id
    validates :price
    validates :charge_id
    validates :shipment_source_id
    validates :day_id
    validates :image
    validates :price, numericality: { with: /\A[0-9]+\z/, greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :charge_id
    validates :day_id
    validates :shipment_source_id
    validates :status_id
  end
end
