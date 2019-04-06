class StaticPagesController < ApplicationController
  def home
    @books =
      Book.search_book(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.static_page.per_page
  end

  def help; end

  def about; end

  def contact; end
end
