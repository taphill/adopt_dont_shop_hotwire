# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits home page', type: :feature do
  before do
    visit '/'
  end

  it 'can navigate to home page' do
    visit '/shelters'
    click_link "Adopt Don't Shop"
    expect(page).to have_current_path('/')
  end

  it 'can navigate to shelters/index page' do
    click_link 'Shelters'
    expect(page).to have_current_path('/shelters')
  end

  it 'can navigate to pets/index page' do
    click_link 'Pets'
    expect(page).to have_current_path('/pets')
  end
end
