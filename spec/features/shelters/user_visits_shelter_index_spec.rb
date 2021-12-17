# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits shelters/index page', type: :feature do
  let(:button_name) { 'View Pets' }

  it 'can see all shelters' do
    shelter_1 = create(:shelter)
    shelter_2 = create(:shelter)
    shelter_3 = create(:shelter)

    visit '/shelters'

    within '#shelter-0' do
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.rank)
      expect(page).to have_button(button_name)
    end

    within '#shelter-1' do
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_content(shelter_2.city)
      expect(page).to have_content(shelter_2.state)
      expect(page).to have_content(shelter_2.rank)
      expect(page).to have_button(button_name)
    end

    within '#shelter-2' do
      expect(page).to have_content(shelter_3.name)
      expect(page).to have_content(shelter_3.city)
      expect(page).to have_content(shelter_3.state)
      expect(page).to have_content(shelter_3.rank)
      expect(page).to have_button(button_name)
    end
  end

  it 'can navigate to a shelters pets page' do
    shelter_1 = create(:shelter)

    visit '/shelters'

    within '#shelter-0' do
      click_button button_name
    end

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")
  end
end
