# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PetComponent, type: :component do
  let(:pet) { create(:pet) }

  before do
    render_inline(
      PetComponent.new(
        id: pet.id,
        name: pet.name,
        age: pet.age,
        breed: pet.breed,
        adoptable: pet.adoptable
      )
    )
  end

  it { expect(rendered_component).to have_css('div[class="pet"]') }
  it { expect(rendered_component).to have_text(pet.name.to_s) }
  it { expect(rendered_component).to have_text(pet.age.to_s) }
  it { expect(rendered_component).to have_text(pet.breed.to_s) }

  context 'when adoptable' do
    it 'renders adoptable image' do
      expect(page.find('img')['src']).to have_content('adoption_1')
    end
  end

  context 'when not adoptable' do
    it 'renders certificate image' do
      pet = create(:pet, adoptable: false)

      render_inline(
        PetComponent.new(
          id: pet.id,
          name: pet.name,
          age: pet.age,
          breed: pet.breed,
          adoptable: pet.adoptable
        )
      )

      expect(page.find('img')['src']).to have_content('certificate')
    end
  end
end
