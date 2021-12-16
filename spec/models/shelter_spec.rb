# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'validations' do
    subject { build(:shelter) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:rank) }
    it { is_expected.to validate_numericality_of(:rank) }
    it { is_expected.to validate_presence_of(:foster_program) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:pets) }
  end
end
