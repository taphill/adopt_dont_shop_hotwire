# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper
class ApplicationComponent < ViewComponent::Base
  attr_reader :id, :first_name, :last_name, :address, :city, :state,
              :zip, :description, :status, :pets

  def initialize(data)
    @id = data[:id]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @address = data[:address]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @description = data[:description]
    @status = format_status(data[:status])
    @pets = data[:pets]
  end

  def format_status(status)
    case status
    when 'in_progress'
      status.sub('_', ' ').capitalize
    else
      status.capitalize
    end
  end
end
# rubocop:enable Lint/MissingSuper
