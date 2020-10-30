class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :charge, :day, :shipment_source, :status
  has_one_attached :image

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

 with_options { other_than: 1 } do 
    validates :category_id, numericality:
    validates :charge_id, numericality:
    validates :day_id, numericality:
    validates :shipment_source, numericality:
    validates :status, numericality:
 end
end
