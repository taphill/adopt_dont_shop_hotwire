# frozen_string_literal: true

class RootController < ApplicationController
  def index; end

  def not_found
    render 'error_pages/not_found'
  end
end
