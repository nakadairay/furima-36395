FactoryBot.define do
  factory :order_address do
    postcode { '992-0025' }
    shipment_id { 2 }
    city { '米沢市' }
    block { '通町2-8-35' }
    building { '草苅ビル２F' }
    phone_number { '08012345678' }
  end
end
