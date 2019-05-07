class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: %i(show destroy edit update)
  before_action :admin_user, :logged_in_user, only: %i(new edit index destroy)

  def index
    @search = Category.ransack params[:q]
    @categories = @search.result.newest.paginate page: params[:page],
      per_page: Settings.category.per_page
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".error"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".login"
    redirect_to login_url
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".error"
    redirect_to root_path
  end
end
