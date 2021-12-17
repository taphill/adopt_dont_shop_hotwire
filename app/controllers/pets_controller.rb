# frozen_string_literal: true

class PetsController < ApplicationController
  def index
    @pets = Pet.all 
  end
end
