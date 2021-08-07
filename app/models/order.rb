class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipment

  belongs_to :user
  belongs_to :item
  has_one :address
end
