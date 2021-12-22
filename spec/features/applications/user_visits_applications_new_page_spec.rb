# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits applications new page', type: :feature do
  let(:user) { create(:user) }

  before do
    visit '/login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    find('[name=commit]').click
  end

  it 'can start an application' do
    visit "/users/#{user.id}/applications/new"

    first_name = 'Mike'
    last_name = 'Jones'
    address = '146 Cinderella Cove'
    city = 'South Micha'
    state = 'LA'
    zip = '56073-1328'
    description = 'Similique porro tempora. In hic quia. Quasi non voluptatum. Odio culpa natus. Temporibus ipsa sit.'

    fill_in :application_first_name, with: first_name
    fill_in :application_last_name, with: last_name
    fill_in :application_address, with: address
    fill_in :application_city, with: city
    fill_in :application_state, with: state
    fill_in :application_zip, with: zip
    fill_in :application_description, with: description

    click_button 'Submit'

    application = Application.last

    expect(page).to have_current_path("/users/#{user.id}/applications/#{application.id}")
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(address)
    expect(page).to have_content(city)
    expect(page).to have_content(state)
    expect(page).to have_content(zip)
    expect(page).to have_content(description)
    expect(page).to have_content('In Progress')
  end
end
