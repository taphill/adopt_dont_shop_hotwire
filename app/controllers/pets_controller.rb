# frozen_string_literal: true

class PetsController < ApplicationController
  skip_before_action :require_login

  def index
    @pets = Pet.all
  end
end
