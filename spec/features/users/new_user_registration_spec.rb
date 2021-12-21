# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits home page', type: :feature do
  before do
    visit '/register'
  end

  it { expect(page).to have_field('Username') }
  it { expect(page).to have_field('Password') }
  it { expect(page).to have_field('Password confirmation') }
  it { expect(page).to have_button('Create Account') }

  context 'when valid' do
    it 'creates a user' do
      username = 'mikejones'
      password = 'houston'
      password_confirmation = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password_confirmation

      click_button 'Create Account'

      user = User.find_by(username: username)
      expect(user.username).to eq(username)
      expect(page).to have_current_path('/profile')
    end
  end

  context 'when username is blank' do
    it 'displays error' do
      username = ''
      password = 'houston'
      password_confirmation = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password_confirmation

      click_button 'Create Account'

      within '.error-explanation' do
        expect(page).to have_content("Username can't be blank")
      end
    end
  end

  context 'when password is blank' do
    it 'displays error' do
      username = 'mikejones'
      password = ''
      password_confirmation = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password_confirmation

      click_button 'Create Account'

      within '.error-explanation' do
        expect(page).to have_content("Password can't be blank")
      end
    end
  end

  context "when password confirmation doesn't match password" do
    it 'displays error' do
      username = 'mikejones'
      password = 'houston'
      password_confirmation = 'hous'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password_confirmation

      click_button 'Create Account'

      within '.error-explanation' do
        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end
  end

  context 'when all fields are empty' do
    it 'displays error' do
      username = ''
      password = ''
      password_confirmation = ''

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password_confirmation

      click_button 'Create Account'

      within '.error-explanation' do
        expect(page).to have_content("Username can't be blank")
        expect(page).to have_content("Password can't be blank")
        expect(page).to have_content("Password confirmation can't be blank")
      end
    end
  end

  context 'when username already exists' do
    it 'displays error' do
      create(:user, username: 'mikejones')

      username = 'mikejones'
      password = 'houston'
      password_confirmation = 'houston'

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password_confirmation

      click_button 'Create Account'

      within '.error-explanation' do
        expect(page).to have_content('Username has already been taken')
      end
    end
  end
end
