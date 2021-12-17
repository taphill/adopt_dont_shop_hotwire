# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor visits login page', type: :feature do
  before do
    visit '/login'
  end

  it { expect(page).to have_field('username') }
  it { expect(page).to have_field('password') }
  it { expect(page).to have_link('Register now') }

  it 'can navigate to register page' do
    click_link 'Register now'
    expect(page).to have_current_path('/register')
  end
end
