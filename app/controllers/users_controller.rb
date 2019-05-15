class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update destroy)
  before_action :logged_in_user, only: %i(index edit update)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :is_admin?, only: :index
  before_action :search_book, only: %i(new show edit)

  def show; end

  def new
    @user = User.new
  end

  def index
    @search = User.ransack params[:q]
    @users = @search.result.paginate page: params[:page],
      per_page: Settings.user.per_page
    respond_to do |format|
      format.html
      format.csv{send_data User.to_csv}
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".destroy_s"
    else
      flash[:danger] = t ".destroy_f"
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".login"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_path unless current_user?(@user)
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".error"
    redirect_to root_path
  end

  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
