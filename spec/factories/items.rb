FactoryBot.define do
  factory :item do
    item_name                     { '2' }
    description                   { '2' }
    category_id                   { '2' }
    status_id                     { '2' }
    price                         { 3000 }
    charge_id                     { '2' }
    shipment_source_id            { '2' }
    day_id                        { '2' }
    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
