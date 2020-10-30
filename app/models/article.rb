class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :charge, :day, :shipment_source, :status


 with_options presence: true do
    validates :title, :text, :category
    validates :title, :text, :charge
    validates :title, :text, :day
    validates :title, :text, :shipment_source
    validates :title, :text, :status
 end
 with_options { other_than: 1 } do 
    validates :category_id, numericality:
    validates :charge_id, numericality:
    validates :day_id, numericality:
    validates :shipment_source, numericality:
    validates :status, numericality:
 end
end