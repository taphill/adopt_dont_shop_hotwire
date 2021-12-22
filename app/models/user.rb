# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :applications, dependent: :destroy

  has_secure_password
end
