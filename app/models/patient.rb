class Patient < ApplicationRecord 
    has_secure_password 

    has_many :appointments 
    has_many :physicians, through: :appointments 

    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true

    def self.from_omniauth(response)
        Patient.find_or_create_by(uid: response['uid'], provider: response['provider']) do |u|
            u.name = response['info']['name']
            u.email = response['info']['email']
            u.password = SecureRandom.hex(15)
        end
    end 
end 
