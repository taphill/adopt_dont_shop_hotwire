# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits pets/index page', type: :feature do
  let!(:pet_1) { create(:pet) }
  let!(:pet_2) { create(:pet) }
  let!(:pet_3) { create(:pet) }

  before do
    visit '/pets'
  end

  it 'can see all pets' do
    within "#pet-#{pet_1.id}" do
      expect(page).to have_content(pet_1.name)
    end

    within "#pet-#{pet_2.id}" do
      expect(page).to have_content(pet_2.name)
    end

    within "#pet-#{pet_3.id}" do
      expect(page).to have_content(pet_3.name)
    end
  end
end
