class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @categories =
      Category.newest.paginate page: params[:page],
        per_page: Settings.category.per_page
  end

  def show; end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".error"
    redirect_to root_path
  end
end
