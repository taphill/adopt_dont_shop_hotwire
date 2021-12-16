# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Veterinarian, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:review_rating) }
    it { is_expected.to validate_numericality_of(:review_rating) }
    it { is_expected.to validate_presence_of(:on_call) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:veterinary_office) }
  end
end
