class OrderSerializer < ActiveModel::Serializer
  attributes :id, :purchased
  has_one :user
end
