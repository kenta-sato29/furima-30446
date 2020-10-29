FactoryBot.define do
  factory :item do
    item_name                     { 'カメラ' }
    description                   { '写真を撮る' }
    category_id                   { 'メンズ' }
    status_id                     { '新品・未使用' }
    price                         { 3000 }
    charge_id                     { '着払い' }
    shipment_source_id            { '北海道' }
    day_id                        { '1~2日' }
  end
end
