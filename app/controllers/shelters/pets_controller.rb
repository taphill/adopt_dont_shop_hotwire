# frozen_string_literal: true

module Shelters
  class PetsController < ApplicationController
    skip_before_action :require_login

    def index
      @pets = Shelter.find(params[:shelter_id]).pets
    end
  end
end
