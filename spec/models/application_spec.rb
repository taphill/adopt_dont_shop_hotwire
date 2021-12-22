# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:pet_applications) }
    it { is_expected.to have_many(:pets).through(:pet_applications) }
  end
end
