# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits /shelters/:shelter_id/pets page', type: :feature do
  context 'when a shelter has pets' do
    it 'can see all pets' do
      shelter = create(:shelter)
      pet_1 = create(:pet, shelter: shelter)
      pet_2 = create(:pet, shelter: shelter)
      pet_3 = create(:pet, shelter: shelter)

      visit "/shelters/#{shelter.id}/pets"

      within '#pet-0' do
        expect(page).to have_content(pet_1.name)
        expect(page).to have_content(pet_1.breed)
        expect(page).to have_content(pet_1.age)
      end

      within '#pet-1' do
        expect(page).to have_content(pet_2.name)
        expect(page).to have_content(pet_2.breed)
        expect(page).to have_content(pet_2.age)
      end

      within '#pet-2' do
        expect(page).to have_content(pet_3.name)
        expect(page).to have_content(pet_3.breed)
        expect(page).to have_content(pet_3.age)
      end
    end
  end

  context 'when a shelter has no pets' do
    it 'sees no pets page' do
      shelter = create(:shelter)

      visit "/shelters/#{shelter.id}/pets"

      expect(page).to have_content('Currently, there are no pets at this shelter.')
    end
  end
end
