# frozen_string_literal: true

module Users
  class ApplicationsController < ApplicationController
    def index
      @applications = current_user.applications
    end

    def show
      @application = Application.find_by(id: params[:id], user_id: current_user.id)

      if @application.present?
        render :show
      else
        render 'errors_pages/not_found'
      end
    end

    def new
      @application = Application.new
    end

    def create
      @application = Application.new(user_id: current_user.id, **application_params)
      
      if @application.present? && @application.save
        redirect_to "/users/#{current_user.id}/applications/#{@application.id}"
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def application_params
      params.require(:application).permit(
        :first_name,
        :last_name,
        :address,
        :city,
        :state,
        :zip,
        :description
      )
    end
  end
end
