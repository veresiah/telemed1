class Appointment < ApplicationRecord
    belongs_to :patient 
    belongs_to :physician

    validates :date, :reason, presence: true
end
