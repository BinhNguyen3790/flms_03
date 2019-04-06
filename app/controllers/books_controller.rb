class BooksController < ApplicationController
  def index
    @books = Book.search_book(params[:search]).newest.paginate page: params[:page],
      per_page: Settings.book.per_page
  end
end
