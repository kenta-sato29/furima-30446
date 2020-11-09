FactoryBot.define do
  factory :user_buy do
    post                       { '111-1111' }
    shipment_source_id         { '2' }
    first_number               { '横浜市緑区' }
    second_number              { '青山1-1-1' }
    tel                        { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
