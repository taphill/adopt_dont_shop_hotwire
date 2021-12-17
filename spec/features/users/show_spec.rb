# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  it 'keeps a user logged in after registering' do
    visit '/register'

    username = 'mikejones'
    password = 'houston'
    password_confirmation = 'houston'

    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password_confirmation

    click_button 'Create Account'

    visit '/profile'

    expect(page).to have_content("Hello, #{username}!")
  end
end
