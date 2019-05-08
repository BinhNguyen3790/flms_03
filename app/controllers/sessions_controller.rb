class SessionsController < ApplicationController
  before_action :search_book, only: :new
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t ".success"
    redirect_to root_path
  end
end
