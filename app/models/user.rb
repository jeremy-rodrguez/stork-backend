class User < ApplicationRecord
    has_secure_password

    has_many :orders

    validates_presence_of :name
    validates_presence_of :email
    validates_uniqueness_of :email
    validates :password, :presence => true,
    :length => {:within => 6..40}
end
