class Patient < ApplicationRecord 
    has_many :appointments 
    has_many :physicians, though: :appointments 

    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true
end 
