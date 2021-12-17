# frozen_string_literal: true

class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates :breed, presence: true

  belongs_to :shelter
end
