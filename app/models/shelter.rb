class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :rank, presence: true, numericality: true
  validates :foster_program, presence: true, inclusion: [true, false], exclusion: [nil]

  has_many :pets
end
