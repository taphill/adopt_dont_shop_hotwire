# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper
class PetComponent < ViewComponent::Base
  attr_reader :id, :name, :age, :breed, :adoptable

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @age = data[:age]
    @breed = data[:breed]
    @adoptable = data[:adoptable]
  end
end
# rubocop:enable Lint/MissingSuper
