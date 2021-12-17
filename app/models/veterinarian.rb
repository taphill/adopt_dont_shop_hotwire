# frozen_string_literal: true

class Veterinarian < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :review_rating, presence: true, numericality: true

  belongs_to :veterinary_office
end
