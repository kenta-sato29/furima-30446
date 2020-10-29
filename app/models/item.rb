class Item < ApplicationRecord
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
    validates :price, numericality: { with: /\A[0-9]+\z/, greater_than: 299, less_than: 10_000_000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
