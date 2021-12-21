# frozen_string_literal: true

class RootController < ApplicationController
  skip_before_action :require_login

  def index; end

  def not_found
    render 'error_pages/not_found'
  end
end
