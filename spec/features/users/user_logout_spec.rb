# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User log out', type: :feature do
  before do
    user = create(:user)

    visit '/login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    find('[name=commit]').click
  end

  it 'can log out' do
    click_button 'Log out'
    expect(page).to have_current_path('/')
  end
end
