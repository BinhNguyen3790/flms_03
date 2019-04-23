class Admin::RequestsController < ApplicationController
  before_action :admin_user, only: %i(update index)
  before_action :load_request, only: :update
  before_action :logged_in_user, only: :index

  def index
    @requests = Request.newest.paginate page: params[:page],
      per_page: Settings.request.per_page
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t ".success"
      redirect_to admin_requests_path
    else
      render :index
    end
  end

  private

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def request_params
    params.require(:request).permit :status
  end

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:danger] = t ".load_fail"
    redirect_to admin_requests_path
  end
end
