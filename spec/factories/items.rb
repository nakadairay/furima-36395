FactoryBot.define do
  factory :item do
    product_name  { Faker::Games::Pokemon.name }
    description { Faker::Games::Pokemon.location }
    price { rand(300..9_999_999) }
    category_id { 2 }
    postage_id { 2 }
    status_id { 2 }
    shipment_id { 2 }
    estimated_shipping_id { 2 }

    association :user

    after(:build) do |image|
      image.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
