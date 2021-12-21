# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShelterComponent, type: :component do
  let(:shelter) { create(:shelter) }

  before do
    render_inline(
      ShelterComponent.new(
        id: shelter.id,
        name: shelter.name,
        city: shelter.city,
        state: shelter.state,
        rank: shelter.rank,
        foster_program: shelter.foster_program
      )
    )
  end

  it { expect(rendered_component).to have_css('div[class="shelter"]') }
  it { expect(rendered_component).to have_css('span[class="tool"]') }
  it { expect(rendered_component).to have_text("##{shelter.rank}") }
  it { expect(rendered_component).to have_text(shelter.name.to_s) }
  it { expect(rendered_component).to have_text(shelter.city.to_s) }
  it { expect(rendered_component).to have_text(shelter.state.to_s) }
  it { expect(rendered_component).to have_button('View Pets') }

  context 'when shelter has foster program' do
    it 'renders check mark image' do
      expect(page.find('img')['src']).to have_content('accept')
    end
  end

  context 'when shelter does not have a foster program' do
    it 'renders certificate image' do
      shelter = create(:shelter, foster_program: false)

      render_inline(
        ShelterComponent.new(
          id: shelter.id,
          name: shelter.name,
          city: shelter.city,
          state: shelter.state,
          rank: shelter.rank,
          foster_program: shelter.foster_program
        )
      )

      expect(page.find('img')['src']).to have_content('cancel')
    end
  end
end
