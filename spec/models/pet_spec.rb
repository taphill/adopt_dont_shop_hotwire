# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age) }
    it { is_expected.to validate_presence_of(:breed) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:shelter) }
    it { is_expected.to have_many(:pet_applications) }
    it { is_expected.to have_many(:applications).through(:pet_applications) }
  end
end
