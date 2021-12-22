# frozen_string_literal: true

class PetsController < ApplicationController
  skip_before_action :require_login

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find_by(id: params[:id])

    if @pet.present?
      render :show
    else
      render 'error_pages/not_found'
    end
  end
end
