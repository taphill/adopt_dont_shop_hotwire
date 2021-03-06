# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:pet) }
    it { is_expected.to belong_to(:application) }
  end
end
