class Veterinarian < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :review_rating, presence: true, numericality: true
  validates :on_call, presence: true, inclusion: [true, false], exclusion: [nil]

  belongs_to :veterinary_office
end
