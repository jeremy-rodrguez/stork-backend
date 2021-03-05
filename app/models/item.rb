class Item < ApplicationRecord
    has_many :order_items, :dependent => :destroy
    has_many :orders, through: :order_items

    has_many :favorites
    has_many :users, through: :favorites
end
