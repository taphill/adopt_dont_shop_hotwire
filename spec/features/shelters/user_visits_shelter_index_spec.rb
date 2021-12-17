# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits shelters/index page', type: :feature do
  let!(:shelter_1) { create(:shelter) }
  let!(:shelter_2) { create(:shelter) }
  let!(:shelter_3) { create(:shelter) }

  before do
    visit '/shelters'
  end

  it 'can see all shelters' do
    within '#shelter-0' do
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.rank)
    end

    within '#shelter-1' do
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_content(shelter_2.city)
      expect(page).to have_content(shelter_2.state)
      expect(page).to have_content(shelter_2.rank)
    end

    within '#shelter-2' do
      expect(page).to have_content(shelter_3.name)
      expect(page).to have_content(shelter_3.city)
      expect(page).to have_content(shelter_3.state)
      expect(page).to have_content(shelter_3.rank)
    end
  end
end
