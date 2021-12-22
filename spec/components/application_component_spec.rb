# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationComponent, type: :component do
  let(:application) { create(:application) }

  before do
    render_inline(
      ApplicationComponent.new(
        id: application.id,
        first_name: application.first_name,
        last_name: application.last_name,
        address: application.address,
        city: application.city,
        state: application.state,
        zip: application.zip,
        description: application.description,
        status: application.status,
        pets: application.pets
      )
    )
  end

  it { expect(rendered_component).to have_css('div[class="application"]') }
  it { expect(rendered_component).to have_text(application.first_name) }
  it { expect(rendered_component).to have_text(application.last_name) }
  it { expect(rendered_component).to have_text(application.address) }
  it { expect(rendered_component).to have_text(application.city) }
  it { expect(rendered_component).to have_text(application.state) }
  it { expect(rendered_component).to have_text(application.zip) }
  it { expect(rendered_component).to have_text(application.description) }
  it { expect(rendered_component).to have_text(application.status) }

  context 'when application has pets' do
    it 'shows all the pets' do
      pet_1 = create(:pet)
      pet_2 = create(:pet)
      pet_3 = create(:pet)
      create(:pet_application, pet: pet_1, application: application)
      create(:pet_application, pet: pet_2, application: application)
      create(:pet_application, pet: pet_3, application: application)

      render_inline(
        ApplicationComponent.new(
          id: application.id,
          first_name: application.first_name,
          last_name: application.last_name,
          address: application.address,
          city: application.city,
          state: application.state,
          zip: application.zip,
          description: application.description,
          status: application.status,
          pets: application.pets
        )
      )

      expect(rendered_component).to have_link(pet_1.name)
      expect(rendered_component).to have_link(pet_2.name)
      expect(rendered_component).to have_link(pet_3.name)
    end
  end

  context 'when application has no pets' do
    it 'shows all a no pets message' do
      expect(rendered_component).to have_text('No pets added')
    end
  end
end
