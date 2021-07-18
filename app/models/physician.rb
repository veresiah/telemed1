class Physician < ApplicationRecord
    has_many :appointments 
    has_many :patients, through: :appointments 

    validates :name, :speciality, :hospital, :education, :years_in_practice, presence: true
end
