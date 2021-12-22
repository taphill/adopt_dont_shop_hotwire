# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits applications show page', type: :feature do
  let!(:user) { create(:user) }
  let!(:application_1) { create(:application, user: user) }
  let!(:application_2) { create(:application, user: user) }
  let!(:pet_1) { create(:pet) }
  let!(:pet_2) { create(:pet) }
  let!(:pet_3) { create(:pet) }
  let!(:pet_application_1) { create(:pet_application, application: application_1, pet: pet_1) }
  let!(:pet_application_2) { create(:pet_application, application: application_1, pet: pet_2) }
  let!(:pet_application_3) { create(:pet_application, application: application_2, pet: pet_1) }
  let!(:pet_application_4) { create(:pet_application, application: application_2, pet: pet_2) }
  let!(:pet_application_5) { create(:pet_application, application: application_2, pet: pet_3) }

  before do
    visit '/login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    find('[name=commit]').click

    click_link 'View your applications'
  end

  context 'when successful' do
    it { expect(page).to have_current_path("/users/#{user.id}/applications") }
    it { expect(page).to have_content(application_1.first_name) }
    it { expect(page).to have_content(application_1.last_name) }
    it { expect(page).to have_content(application_1.city) }
    it { expect(page).to have_content(application_1.state) }
    it { expect(page).to have_content(application_1.zip) }
    it { expect(page).to have_content('In progress') }
    it { expect(page).to have_link(application_1.pets.first.name) }
  end
end
