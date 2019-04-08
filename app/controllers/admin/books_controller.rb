class Admin::BooksController < ApplicationController
  def index
    @books =
      Book.search_book(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.book.per_page
  end

  def show; end

  def destroy
    if @book.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".error"
    end
    redirect_to books_path
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".error"
    redirect_to root_path
  end
end
