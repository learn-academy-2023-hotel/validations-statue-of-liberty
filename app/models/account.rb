class Account < ApplicationRecord
    has_many :addresses
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5 }
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6 }
    validates :password, uniqueness: true
    # validates_associated :addresses
    # validates :address, uniqueness: { scope: [:address_number, :address_name, :zip], message: 'must not duplicate for each account' }
end
