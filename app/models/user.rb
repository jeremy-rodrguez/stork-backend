class User < ApplicationRecord
    has_secure_password

    has_many :orders

    has_many :favorites
    has_many :items, through: :favorites
    
    validates_presence_of :email
    validates_uniqueness_of :email
    validates :password, :presence => true, :length => {:within => 6..40}

    # def get_favorites
    #     favorites = Favorite.all
    #     items = Item.all
    # end
end
