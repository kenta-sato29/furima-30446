class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :charge, :day, :shipment_source, :status

  validates :title, :text, :category, presence: true
  validates :category_id, numericality: { other_than: 1 }

  validates :title, :text, :charge, presence: true
  validates :charge_id, numericality: { other_than: 1 }

  validates :title, :text, :day, presence: true
  validates :day_id, numericality: { other_than: 1 }

  validates :title, :text, :shipment_source, presence: true
  validates :shipment_source, numericality: { other_than: 1 }

  validates :title, :text, :status, presence: true
  validates :status, numericality: { other_than: 1 }


end
