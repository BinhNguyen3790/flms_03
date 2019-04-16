class StaticPagesController < ApplicationController
  def home
    @books =
      Book.newest.paginate page: params[:page],
        per_page: Settings.static_page.per_page
    @categories =
      Category.newest.paginate page: params[:page],
        per_page: Settings.static_page.per_page
  end

  def help; end

  def about; end

  def contact; end
end
