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
    within '#pet-0' do
      expect(page).to have_content(pet_1.name)
    end

    within '#pet-1' do
      expect(page).to have_content(pet_2.name)
    end

    within '#pet-2' do
      expect(page).to have_content(pet_3.name)
    end
  end
end
