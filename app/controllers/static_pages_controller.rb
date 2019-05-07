class StaticPagesController < ApplicationController
  before_action :search_book, only: %i(home help about contact)

  def home
    @categories =
      Category.newest.paginate page: params[:page],
        per_page: Settings.static_page.page
  end

  def help; end

  def about; end

  def contact; end
end
