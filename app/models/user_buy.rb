class UserBuy
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post, :shipment_source_id, :first_number, :second_number, :building_name, :tel
  attr_accessor :price, :token

  with_options presence: true do
    validates :post, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipment_source_id, numericality: { other_than: 1 }
    validates :first_number
    validates :second_number
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post: post, tel: tel, shipment_source_id: shipment_source_id, first_number: first_number, second_number: second_number, building_name: building_name, purchase_id: purchase.id)
 end
end
