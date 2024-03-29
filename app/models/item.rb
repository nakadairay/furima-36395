class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :status
  belongs_to :shipment
  belongs_to :estimated_shipping

  with_options presence: true do
    validates :images
    validates :product_name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1, messages: "can't be blank" } do
      validates :category_id
      validates :postage_id
      validates :status_id
      validates :shipment_id
      validates :estimated_shipping_id
    end
  end

  has_many_attached :images
  belongs_to :user
  has_one :order
end
