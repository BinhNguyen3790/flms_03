class BooksController < ApplicationController
  before_action :load_book, :load_request, only: :show

  def index
    @books =
      Book.search_book(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.book.per_page
  end

  def show; end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".error"
    redirect_to root_path
  end

  private

  def load_request
    @request = @book.requests.new
  end
end
