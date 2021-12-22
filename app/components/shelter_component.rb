# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper
class ShelterComponent < ViewComponent::Base
  attr_reader :id, :name, :city, :state, :rank, :foster_program

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
    @rank = data[:rank]
    @foster_program = data[:foster_program]
  end
end
# rubocop:enable Lint/MissingSuper
