class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipment_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, messages: 'is invalid. Include hyphen(-)' }
    validates :shipment_id, numericality: { other_than: 1, messages: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, messages: 'is invalid. Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postcode: postcode, shipment_id: shipment_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
