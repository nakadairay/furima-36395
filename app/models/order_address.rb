class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipment_id, :city, :block, :building, :phone_number
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode
    validates :shipment_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postcode: postcode, shipment_id: shipment_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end