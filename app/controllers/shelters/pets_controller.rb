# frozen_string_literal: true

module Shelters
  class PetsController < ApplicationController
    def index
      @pets = Shelter.find(params[:shelter_id]).pets
    end
  end
end
