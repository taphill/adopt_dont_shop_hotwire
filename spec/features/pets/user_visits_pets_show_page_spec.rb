# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits pets/index page', type: :feature do
  let(:pet) { create(:pet) }

  context 'when successful' do
    it 'displays the pets information' do
      visit "/pets/#{pet.id}"

      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.age)
      expect(page).to have_content(pet.breed)
    end
  end

  context 'when pet id does not exist' do
    it 'renders 404' do
      visit '/pets/500'

      expect(page).to have_content("Sorry, this isn't the page you're looking for.")
    end
  end
end
