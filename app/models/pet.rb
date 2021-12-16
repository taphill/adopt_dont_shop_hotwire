class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates :breed, presence: true
  validates :adoptable, presence: true, inclusion: [true, false], exclusion: [nil]

  belongs_to :shelter
end
