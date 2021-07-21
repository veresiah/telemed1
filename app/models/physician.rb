class Physician < ApplicationRecord
    has_many :appointments 
    has_many :patients, through: :appointments 

    validates :name, :speciality, :hospital, :education, :years_in_practice, presence: true

    def self.alphabetized
        Physician.order(name: :asc)
    end 

    def self.sort_speciality
        Physician.order(speciality: :asc)
    end 

    def self.search(search)
        if search
            Physician.all.where('name LIKE ?', "#{search}")
        else
            @physicians = Physician.sort_speciality.alphabetized
        end 
    end
end
