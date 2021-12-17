# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  before do
    visit '/login'
  end

  context 'when the user already exists' do
    it 'can login' do
      user = create(:user)

      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_button 'Login'

      expect(page).to have_current_path('/profile')
      expect(page).to have_content("Hello, #{user.username}!")
    end
  end

  context 'when username does not exist' do
    it 'can not login' do
      fill_in :username, with: 'mikejones'
      fill_in :password, with: 'houston'

      click_button 'Login'

      expect(page).to have_current_path('/login')

      within '.error-explanation' do
        expect(page).to have_content('Incorrect username or password')
      end
    end
  end

  context 'when password is not correct' do
    it 'can not login' do
      user = create(:user)

      fill_in :username, with: user.username
      fill_in :password, with: 'pass'

      click_button 'Login'

      expect(page).to have_current_path('/login')

      within '.error-explanation' do
        expect(page).to have_content('Incorrect username or password')
      end
    end
  end
end
