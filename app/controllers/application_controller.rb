# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  helper_method :current_user

  private

  def require_login
    return if current_user

    redirect_to '/login'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
