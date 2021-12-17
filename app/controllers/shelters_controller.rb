# frozen_string_literal: true

class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end
end
