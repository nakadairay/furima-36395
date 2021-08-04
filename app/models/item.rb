class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :status
  belongs_to :shipment
  belongs_to :estimated_shipping

  with_options presence: true do
    validates :product_name
    validates :price
    validates :description
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :postage_id
      validates :status_id
      validates :shipment_id
      validates :estimated_shipping_id
    end
  end

  has_one_attached :image
  belongs_to :user
end
