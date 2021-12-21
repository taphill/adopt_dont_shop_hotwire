# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/profile'
    else
      flash.now[:error] = 'Incorrect username or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
