# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VeterinaryOffice, type: :model do
  describe 'validations' do
    subject { build(:veterinary_office) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:max_patient_capacity) }
    it { is_expected.to validate_numericality_of(:max_patient_capacity) }
    it { is_expected.to validate_presence_of(:boarding_services) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:veterinarians) }
  end
end
