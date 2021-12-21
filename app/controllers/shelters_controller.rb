# frozen_string_literal: true

class SheltersController < ApplicationController
  skip_before_action :require_login

  def index
    @shelters = Shelter.all
  end
end
