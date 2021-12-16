class VeterinaryOffice < ApplicationRecord
  validates :name, presence: true
  validates :max_patient_capacity, presence: true, numericality: true
  validates :boarding_services, presence: true, inclusion: [true, false], exclusion: [nil]

  has_many :veterinarians
end
