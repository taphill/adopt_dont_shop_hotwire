# frozen_string_literal: true

module Users
  class ApplicationsController < ApplicationController
    def index
      @applications = current_user.applications
    end
  end
end
