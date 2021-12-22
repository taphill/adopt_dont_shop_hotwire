# frozen_string_literal: true

class Application < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :address, :city, :state, :zip, presence: true
  validates :description, presence: true
  validates :status, presence: true

  belongs_to :user
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  enum status: {
    in_progress: 0,
    pending: 1,
    accepted: 2,
    rejected: 3
  }
end
